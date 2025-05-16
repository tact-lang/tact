struct StructWithSlice {
    s: Slice;
}

contract SliceStore {
    val: StructWithSlice;

    init() {
        self.val = StructWithSlice{ s: emptyCell().asSlice() };
    }
}