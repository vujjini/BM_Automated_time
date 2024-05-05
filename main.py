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