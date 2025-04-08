struct WithRemaining {
    a: Int;
    rem: Slice as remaining;
}

contract TestContract {
    nested: WithRemaining;

    init() {
        self.nested = WithRemaining{
            a: 10,
            rem: emptyCell().asSlice(),
        };
    }
}
