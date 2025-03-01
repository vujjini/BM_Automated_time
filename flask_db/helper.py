import PyPDF2
import re


class Events:
    def __init__(self):
        self.day = {
            "Ballroom": {""},
            "2500": {"Oval"},
            "2100": {"Ballroom"},
            "2100A": {"Ballroom"},
            "2100AB": {"Ballroom"},
            "2100ABC": {"Ballroom"},
            "2100B": {"Ballroom"},
            "2100BC": {"Ballroom"},
            "2100C": {"Ballroom"},
            "2702": {"2702"},
            "2703": {"2703"},
            "2705": {"2705"},
            "2706": {"2706"},
            "2707": {"2707"},
            "2708": {"2708"},
            "2709": {"2709"},
            "3700": {"3700"},
            "3701": {"3701"},
            "3702": {"3702"},
            "3704": {"3704"},
            "3705": {"3705"},
            "3707": {"3707"},
            "3708": {"3708"},
            "3709": {"3709"},
            "3711": {"3711"},
            "3712": {"3712"},
            "3713": {"3713"},
            "4200": {"4200"},
            "AMP": {"AMP"},
            "Crescent Hill": {"Crescent Hill"},
            "MLK Plaza": {"MLK Plaza"},
            "Bulls Patio": {"Bulls Patio"},
            "Atrium": {"Atrium"},
            "MSC OS MSC N Fire Lane": {"Open Bollards"},
            "Plaza": {"Plaza"},
            "Showcase Table M": {"Showcase Table M"},
            "North Entrance": {"North Entrance"},
            "Showcase Table E": {"Showcase Table M"},
            "Showcase Table N": {"Showcase Table M"},
            "4111": {"4111"},
            "Top of the Palms": {"Top of the Palms"},
            "Crsnt Hill": {"Crsnt Hill"},
            "MLK Stage": {"MLK Stage"},
            "3308": {"3308"},
            "MSC Center Gallery": {"MSC Center Gallery"}
        }

def search_pdf(file_path):
    events = Events() 
    found_events = []

    with open(file_path, 'rb') as file:
        pdf_reader = PyPDF2.PdfReader(file)
        for page_num in range(len(pdf_reader.pages)):
            page_text = pdf_reader.pages[page_num].extract_text()
            lines = page_text.split('\n')
            i = 0
            while i < len(lines):
                line = lines[i]
                # if page_num == 23:
                #     print(line)
                # if len(line) >= 7 and ((("AM" in line) or ("PM" in line))) and (line[9] == "M" or line[8] == "M" or line[7] == "M" or line[6] == "M"):
                if ((len(re.findall("AM|PM", line)) > 0) and (len(re.findall("Banquet|Stock|Custom|U-Shape|Theatre|Conference|Classroom|Hollow", line)) > 0)):
                    next_lines = lines[i + 1:i + 10]
                    hour_line = line.strip()  
                    pattern = r"\b\d{1,2}:\d{2} [AP]M\b"
                    match = re.findall(pattern, hour_line)
                    start_time = match[0]
                    end_time = match[1]
                    next_lines = [line.strip() for line in next_lines]  
                    for next_line in next_lines:
                        if ((len(next_line) == 12) and (next_line[0] == '4')):
                            continue
                        next_line_numbers = re.findall(r'\d+', next_line)
                        alpha = True
                        for number in next_line_numbers:
                            if number in events.day:
                                alpha = False
                                event_info = events.day[number]
                                temp_dict = {}
                                temp_dict["start_time"] = start_time
                                temp_dict["end_time"] = end_time
                                temp_dict["next_line"] = next_line
                                temp_dict["event space"] = number
                                found_events.append(temp_dict)
                                break
                        if alpha == False:
                            break
                        if alpha:
                            for res_space in events.day:
                                if res_space in next_line:
                                    temp_dict = {}
                                    temp_dict["start_time"] = start_time
                                    temp_dict["end_time"] = end_time
                                    temp_dict["next_line"] = next_line
                                    temp_dict["event space"] = res_space
                                    found_events.append(temp_dict)
                    i = i+3
                else:
                    i+=1

    return found_events


# timesheet = search_pdf(r"C:\Users\suraj\Downloads\04.03.2024 Setup Worksheet.pdf")
# for i in timesheet:
#     print(i)