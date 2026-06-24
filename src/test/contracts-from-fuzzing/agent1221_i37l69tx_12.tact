struct CellCarrying {
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
}

contract LowLevelHolders {
    val: CellCarrying;

    init() {
        self.val = CellCarrying{
            cellField: emptyCell(),
            builderField: beginCell(),
            sliceField: emptyCell().asSlice(),
        };
    }
}