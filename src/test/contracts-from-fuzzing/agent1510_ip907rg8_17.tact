struct HasRemaining {
    mainVal: Int as uint32;
    rest: Slice as remaining;
}

contract RemainingTest {
    s: HasRemaining;

    init() {
        self.s = HasRemaining{
            mainVal: 42,
            rest: emptyCell().asSlice()
        };
    }
}