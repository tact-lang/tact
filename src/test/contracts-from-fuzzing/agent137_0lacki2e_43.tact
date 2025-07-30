struct SliceCellMix {
    s: Slice;
    c: Cell;
    s2: Slice;
    c2: Cell;
}

contract TestSliceCellMix {
    store: SliceCellMix;
    init() {
        self.store = SliceCellMix{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            s2: emptyCell().asSlice(),
            c2: emptyCell()
        };
    }
}