struct SliceField {
    s: Slice;
}

contract SliceFieldTest {
    val: SliceField;

    init() {
        self.val = SliceField{ s: beginCell().storeInt(1,8).endCell().asSlice() };
    }
}
