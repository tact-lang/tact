struct CellBuilders {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract TestCellBuilders {
    data: CellBuilders;

    init() {
        self.data = CellBuilders{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}