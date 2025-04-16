struct StructWithSlice {
    data: Slice;
}

contract TestStorage {
    s: StructWithSlice;

    init() {
        self.s = StructWithSlice{ data: emptyCell().asSlice() };
    }
}