struct HasRemaining {
    s: Slice as remaining;
}

contract RemainTest {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{ s: emptyCell().asSlice() };
    }
}
