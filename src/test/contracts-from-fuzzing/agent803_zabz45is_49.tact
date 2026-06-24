struct RemainHold {
    prefix: Int as uint32;
    rest: Slice as remaining;
}

contract RemainFieldTest {
    d: RemainHold;
    init() {
        self.d = RemainHold{
            prefix: 7,
            rest: emptyCell().asSlice()
        };
    }
}