struct StructWithSlice {
    data: Slice;
}

contract TestSliceField {
    f: StructWithSlice;

    init() {
        self.f = StructWithSlice{ data: emptyCell().asSlice() };
    }
}
