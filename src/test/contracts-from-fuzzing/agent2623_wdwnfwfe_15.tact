struct StructWithSliceAndCell {
    s: Slice;
    c: Cell;
}

contract TestContract {
    data: StructWithSliceAndCell;

    init() {
        self.data = StructWithSliceAndCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
        };
    }
}