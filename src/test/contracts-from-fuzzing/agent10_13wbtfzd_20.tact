struct WithRemaining {
    a: Int;
    b: Slice as remaining;
}

contract RemainingStructTest {
    data: WithRemaining;

    init() {
        self.data = WithRemaining{
            a: 42,
            b: emptyCell().asSlice()
        };
    }
}