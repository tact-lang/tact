struct WithRemaining {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract RemainingFieldOrder {
    data: WithRemaining;

    init() {
        self.data = WithRemaining{
            prefix: 7,
            rest: emptyCell().asSlice(),
        };
    }
}