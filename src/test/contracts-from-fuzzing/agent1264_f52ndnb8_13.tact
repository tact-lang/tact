struct SliceHolder {
    s: Slice;
    c: Cell;
}

contract SliceCellFields {
    data: SliceHolder;
    init() {
        self.data = SliceHolder{ s: emptyCell().asSlice(), c: emptyCell() };
    }
}