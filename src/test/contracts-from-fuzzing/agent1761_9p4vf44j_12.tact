struct SliceAndCell {
    a: Slice;
    b: Cell;
    c: Slice;
    d: Cell;
    e: Slice;
}

contract TestContract {
    data: SliceAndCell;

    init() {
        self.data = SliceAndCell{
            a: emptyCell().asSlice(),
            b: emptyCell(),
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: emptyCell().asSlice()
        };
    }
}