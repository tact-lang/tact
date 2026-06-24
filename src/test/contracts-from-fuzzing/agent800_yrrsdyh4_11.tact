struct WithRemaining {
    head: Int as uint32;
    body: Slice as remaining;
}

contract PersistRemains {
    data: WithRemaining;
    init() {
        self.data = WithRemaining{
            head: 55,
            body: emptyCell().asSlice(),
        };
    }
}