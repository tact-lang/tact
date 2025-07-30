struct StructWithSlice {
    s: Slice;
}

contract SliceInStruct {
    data: StructWithSlice;

    init() {
        self.data = StructWithSlice{ s: emptyCell().asSlice() };
    }
}