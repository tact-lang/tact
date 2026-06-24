struct SliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellStorage {
    data: SliceCell;
    init() {
        self.data = SliceCell{s: emptyCell().asSlice(), c: emptyCell()};
    }
    receive() {
        self.data = SliceCell{s: emptyCell().asSlice(), c: emptyCell()};
    }
}