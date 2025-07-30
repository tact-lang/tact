struct CellHolder {
    c: Cell;
}

contract TestContract {
    data: CellHolder;

    init() {
        self.data = CellHolder{
            c: emptyCell()
        };
    }
}