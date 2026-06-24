struct NestedSliceCell {
    s: Slice;
    c: Cell;
    inner: InnerStruct;
}

struct InnerStruct {
    subSlice: Slice;
    subCell: Cell;
}

contract TestNestedSliceCell {
    store: NestedSliceCell;
    init() {
        self.store = NestedSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            inner: InnerStruct{
                subSlice: emptyCell().asSlice(),
                subCell: emptyCell()
            }
        };
    }
}