struct WithRemaining {
    prefix: Int as uint32;
    tail: Slice as remaining;
}

contract RemainingStructField {
    nested: WithRemaining;

    init() {
        self.nested = WithRemaining{
            prefix: 7,
            tail: emptyCell().asSlice()
        };
    }
}
