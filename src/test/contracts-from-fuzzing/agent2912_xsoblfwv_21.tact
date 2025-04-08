struct RefRemaining {
    content: Slice as remaining;
}

contract RemainingTest {
    s: RefRemaining;
    init() {
        self.s = RefRemaining{ content: emptyCell().asSlice() };
    }
}