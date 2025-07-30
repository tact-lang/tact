struct CellStuff {
    c1: Cell;
    c2: Cell;
    sl: Slice;
    bld: Builder;
}

contract StorageCells {
    vals: CellStuff;

    init() {
        self.vals = CellStuff{
            c1: emptyCell(),
            c2: emptyCell(),
            sl: emptyCell().asSlice(),
            bld: beginCell()
        };
    }
}