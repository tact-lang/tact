struct CellTypes {
    cellVal: Cell;
    cellOpt: Cell?;
    sliceVal: Slice;
    sliceOpt: Slice?;
    builderVal: Builder;
    builderOpt: Builder?;
}

contract CellsPersist {
    data: CellTypes;
    init() {
        self.data = CellTypes{
            cellVal: emptyCell(),
            cellOpt: null,
            sliceVal: emptyCell().asSlice(),
            sliceOpt: null,
            builderVal: beginCell(),
            builderOpt: null,
        };
    }
}