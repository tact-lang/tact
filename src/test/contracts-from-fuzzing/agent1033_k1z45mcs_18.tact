struct Party {
    name: String;
    isActive: Bool;
}

struct Event {
    title: String;
    organizer: Party;
    location: String;
}

contract NestedString {
    event: Event;

    init() {
        self.event = Event{
            title: "FuzzCon",
            organizer: Party{ name: "Fuzzer", isActive: true },
            location: "On-chain"
        };
    }
}