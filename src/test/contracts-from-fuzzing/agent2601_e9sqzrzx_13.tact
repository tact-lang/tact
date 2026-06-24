struct WithRemaining {
    prefix: Int as uint32;
    body: Slice as remaining;
}

contract HasRemaining {
    data: WithRemaining;
    init() {
        self.data = WithRemaining{
            prefix: 1234,
            body: emptyCell().asSlice()
        };
    }
}