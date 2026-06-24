struct HasSliceAndCell {
    s: Slice;
    c: Cell;
}

contract MixedCellSlice {
    data: HasSliceAndCell;

    init() {
        self.data = HasSliceAndCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}