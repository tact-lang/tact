struct CellHolder {
    cellData: Cell;
    cellOpt: Cell?;
}

contract TestContract {
    cells: CellHolder;

    init() {
        self.cells = CellHolder{
            cellData: emptyCell(),
            cellOpt: null
        };
    }
}