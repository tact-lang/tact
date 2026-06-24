struct WithRemaining {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainTest {
    data: WithRemaining;

    init() {
        self.data = WithRemaining{
            prefix: 123,
            suffix: emptyCell().asSlice(),
        };
    }
}
