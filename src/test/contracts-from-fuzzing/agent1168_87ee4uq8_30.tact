contract PersistentCell {
    cellField: Cell;
    optCell: Cell?;

    init() {
        self.cellField = emptyCell();
        self.optCell = null;
    }
}