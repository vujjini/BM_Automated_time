from helper_classes import Events
def main():
    events = Events()
    room = "2708"
    event_name = "Random event"
    print(event_name)
    events.day[room] = {}
    events.day[room][event_name] = [1, 2]
    print(events.day[room][event_name][0])
    return 0
main()
import PyPDF2

def search_pdf(file_path, search_string):
    with open(file_path, 'rb') as file:
        pdf_reader = PyPDF2.PdfReader(file)
        found_strings = []
        for page_num in range(len(pdf_reader.pages)):
            page_text = pdf_reader.pages[page_num].extract_text()
            lines = page_text.split('\n')
            for i, line in enumerate(lines):
                if search_string in line:
                    # Determine the index of the previous line (if available)
                    prev_index = max(0, i - 1)
                    # Determine the index of the next line (if available)
                    next_index = min(len(lines) - 1, i + 1)
                    found_strings.append((page_num + 1, lines[prev_index], line, lines[next_index]))
        return found_strings

file_path = r'C:\Users\antho\Downloads\Testing Setup Worksheet.pdf'
search_string = '9:00 AM'
results = search_pdf(file_path, search_string)

if results:
    print(f"Found '{search_string}' in the following pages:")
    for page_num, prev_line, line, next_line in results:
        print(f"Page {page_num}:")
        print("Previous Line:", prev_line)
        print("Found Line:", line)
        print("Next Line:", next_line)
        print()
else:
    print(f"'{search_string}' not found in the PDF.")

#GAMONAMON GAMONAMON GAMONAMON GAMONAMON GAMONAMON
