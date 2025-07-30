struct SliceCell {
    data: Slice;
    cell: Cell;
}

struct SliceCellOptionals {
    data: Slice?;
    cell: Cell?;
}

contract SliceCellCombineTest {
    v1: SliceCell;
    v2: SliceCellOptionals;

    init() {
        self.v1 = SliceCell{
            data: emptyCell().asSlice(),
            cell: emptyCell()
        };
        self.v2 = SliceCellOptionals{
            data: null,
            cell: null
        };
    }
}