struct HasRemaining {
    x: Int;
    payload: Slice as remaining;
}

contract RemainingTest {
    r: HasRemaining;
    init() {
        self.r = HasRemaining{
            x: 10,
            payload: emptyCell().asSlice()
        };
    }
}