struct SliceAndCells {
    s: Slice;
    c: Cell;
    optS: Slice?;
    optC: Cell?;
}

contract SliceCellMixTest {
    data: SliceAndCells;

    init() {
        self.data = SliceAndCells{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            optS: null,
            optC: null,
        };
    }
}