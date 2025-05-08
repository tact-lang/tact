struct HasRemaining {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract RemainingTest {
    f: HasRemaining;

    init() {
        self.f = HasRemaining { prefix: 255, rest: emptyCell().asSlice() };
    }
}
