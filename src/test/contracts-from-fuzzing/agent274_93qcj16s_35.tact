struct SliceCell {
    sl: Slice;
    cl: Cell;
}

contract SliceCellContract {
    x: SliceCell;

    init() {
        self.x = SliceCell{
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
        };
    }
}