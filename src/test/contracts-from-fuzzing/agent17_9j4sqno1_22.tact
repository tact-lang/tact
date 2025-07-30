struct WithRemaining {
    prefix: Int;
    tail: Slice as remaining;
}

contract RemainingField {
    f: WithRemaining;

    init() {
        self.f = WithRemaining{
            prefix: 42,
            tail: emptyCell().asSlice()
        };
    }
}