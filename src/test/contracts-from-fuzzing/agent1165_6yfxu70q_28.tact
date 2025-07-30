struct SliceCellStruct {
    s: Slice;
    c: Cell;
}

contract SliceCellExample {
    pair: SliceCellStruct;

    init() {
        self.pair = SliceCellStruct{ s: emptyCell().asSlice(), c: emptyCell() };
    }
}
