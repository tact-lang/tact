struct OptionalEmptyCell {
    cellOpt: Cell?;
}

contract OptionalCellStorage {
    optData: OptionalEmptyCell;

    init() {
        self.optData = OptionalEmptyCell{
            cellOpt: null
        };
    }
}