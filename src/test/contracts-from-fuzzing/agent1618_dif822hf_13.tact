struct SliceAndCell {
    a: Slice;
    b: Cell;
    c: Slice?;
    d: Cell?;
}

contract TestContract {
    data: SliceAndCell;

    init() {
        self.data = SliceAndCell{
            a: emptyCell().asSlice(),
            b: emptyCell(),
            c: null,
            d: emptyCell()
        };
    }
}