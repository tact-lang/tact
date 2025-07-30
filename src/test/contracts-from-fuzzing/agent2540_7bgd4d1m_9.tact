struct SliceAndCell {
    c: Cell;
    s: Slice;
}

contract CellSliceTest {
    data: SliceAndCell;

    init() {
        self.data = SliceAndCell{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}