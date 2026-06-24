struct HasSliceRemain {
    foo: Int;
    data: Slice as remaining;
}

contract RemainStructTest {
    s: HasSliceRemain;

    init() {
        self.s = HasSliceRemain{ foo: 42, data: emptyCell().asSlice() };
    }
}