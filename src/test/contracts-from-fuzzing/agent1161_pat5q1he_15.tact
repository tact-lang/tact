struct CellNest {
    c1: Cell;
    c2: Cell;
}

struct SliceNest {
    s: Slice;
    cellData: CellNest;
}

contract SlicesContract {
    data: SliceNest;

    init() {
        self.data = SliceNest{
            s: emptyCell().asSlice(),
            cellData: CellNest{ c1: emptyCell(), c2: emptyCell() }
        };
    }
}