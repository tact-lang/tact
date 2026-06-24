struct Sched {
    start: Int;
    end: Int;
    title: String;
    description: String?;
}

contract EventWithOptions {
    e: Sched;

    init() {
        self.e = Sched{
            start: 1000,
            end: 2000,
            title: "Meeting",
            description: null
        };
    }
}