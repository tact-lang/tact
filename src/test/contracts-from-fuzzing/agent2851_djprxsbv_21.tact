struct CellStuff {
    sliceField: Slice;
    builderField: Builder;
    cellField: Cell;
    stringField: String;
}

contract TestCells {
    storage: CellStuff;

    init() {
        self.storage = CellStuff{
            sliceField: emptyCell().asSlice(),
            builderField: beginCell(),
            cellField: emptyCell(),
            stringField: "hello",
        };
    }
}
