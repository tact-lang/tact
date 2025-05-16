struct WithRemaining {
    prefix: Int;
    rest: Slice as remaining;
}

contract PersistRemainingField {
    s: WithRemaining;

    init() {
        self.s = WithRemaining{ prefix: 42, rest: emptyCell().asSlice() };
    }
}