struct HasRemaining {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract RemainingStructTest {
    s: HasRemaining;

    init() {
        self.s = HasRemaining{ prefix: 42, suffix: emptyCell().asSlice() };
    }
}
