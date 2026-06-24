struct HasRemaining {
    val: Slice as remaining;
}

contract RemainingStructTest {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{ val: emptyCell().asSlice() };
    }
}