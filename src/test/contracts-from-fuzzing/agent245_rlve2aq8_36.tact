struct WithRemaining {
    prefix: Int;
    suffix: Slice as remaining;
}

contract RemainingFieldTest {
    f: WithRemaining;

    init() {
        self.f = WithRemaining{
            prefix: 5,
            suffix: emptyCell().asSlice()
        };
    }
}