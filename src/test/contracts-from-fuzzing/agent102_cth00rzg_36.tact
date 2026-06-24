struct CellNesting {
    c: Cell;
    s: Slice;
}

contract RefsInStorage {
    x: CellNesting;

    init() {
        self.x = CellNesting{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}