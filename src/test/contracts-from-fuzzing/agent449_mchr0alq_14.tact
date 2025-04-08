struct HasRemaining {
    prefix: Int as uint32;
    rest: Slice as remaining;
}

contract RemainingFieldTest {
    storage: HasRemaining;

    init() {
        self.storage = HasRemaining{ prefix: 42, rest: emptyCell().asSlice() };
    }
}
