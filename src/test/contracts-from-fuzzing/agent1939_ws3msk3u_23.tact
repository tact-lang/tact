struct CellHolder {
    cell1: Cell;
    cell2: Cell;
}

contract CellContract {
    data: CellHolder;
    init() {
        self.data = CellHolder{ cell1: emptyCell(), cell2: emptyCell() };
    }
}