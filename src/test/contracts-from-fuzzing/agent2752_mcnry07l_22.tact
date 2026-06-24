struct HasSliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellStorage {
    data: HasSliceCell;
    init() {
        let c = beginCell().storeUint(0,1).endCell();
        self.data = HasSliceCell{
            s: c.asSlice(),
            c: c
        };
    }
}