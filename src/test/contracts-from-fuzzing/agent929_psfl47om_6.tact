contract InitCellInInit {
    cellVal: Cell;

    init() {
        self.cellVal = emptyCell();
    }
}