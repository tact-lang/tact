message (555) Event {
    count: Int;
}

contract OptMsg {
    evt: Event?;

    init() {
        self.evt = Event { count: 100 };
    }

    receive() {}
}
