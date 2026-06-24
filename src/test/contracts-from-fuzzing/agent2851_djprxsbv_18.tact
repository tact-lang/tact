struct CellAndBuilder {
    c: Cell;
    b: Builder;
}

contract StorageCells {
    info: CellAndBuilder;

    init() {
        self.info = CellAndBuilder{
            c: emptyCell(),
            b: beginCell(),
        };
    }
}
