struct WithRemaining {
    x: Int;
    rest: Slice as remaining;
}

contract TestContract {
    f: WithRemaining;

    init() {
        self.f = WithRemaining{
            x: 42,
            rest: emptyCell().asSlice()
        };
    }
}