struct HasSliceCell {
    s: Slice;
    c: Cell;
    optS: Slice?;
    optC: Cell?;
}

contract MixedRef {
    data: HasSliceCell;

    init() {
        self.data = HasSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            optS: null,
            optC: null,
        };
    }
}