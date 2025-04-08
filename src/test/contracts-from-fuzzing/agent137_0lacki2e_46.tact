struct StructWithHeader {
    fixed: Int;
    tail: Slice as remaining;
}

contract TestStructWithHeader {
    s: StructWithHeader;
    init() {
        self.s = StructWithHeader{
            fixed: 99,
            tail: emptyCell().asSlice()
        };
    }
}