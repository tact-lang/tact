struct WrapCell {
    cellData: Cell;
}

contract CellStore {
    cellWrap: WrapCell;
    init() {
        self.cellWrap = WrapCell{ cellData: emptyCell() };
    }
}