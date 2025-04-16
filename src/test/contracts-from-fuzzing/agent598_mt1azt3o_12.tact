struct NestedSlice {
    sliceVal: Slice;
    amount: Int;
}

struct CellAndSlice {
    cellVal: Cell;
    nested: NestedSlice;
}

contract CellSliceMix {
    storage: CellAndSlice;

    init() {
        self.storage = CellAndSlice{
            cellVal: emptyCell(),
            nested: NestedSlice{
                sliceVal: emptyCell().asSlice(),
                amount: 9999
            }
        };
    }
}