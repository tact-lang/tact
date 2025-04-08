struct WithRemaining {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainTest {
    s: WithRemaining;
    init() {
        self.s = WithRemaining{
            prefix: 5,
            suffix: emptyCell().asSlice()
        };
    }
}