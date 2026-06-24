struct WithRemaining {
    x: Int;
    y: Slice as remaining;
}

contract RemainingTest {
    s: WithRemaining;

    init() {
        self.s = WithRemaining{
            x: 42,
            y: emptyCell().asSlice()
        };
    }
}