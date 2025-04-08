struct HasSliceCell {
    s: Slice;
    c: Cell;
    o: Slice?;
}

contract TestSlices {
    data: HasSliceCell;

    init() {
        self.data = HasSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            o: null
        };
    }
}