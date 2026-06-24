struct CellHolder {
    c: Cell;
}

contract CellInState {
    data: CellHolder;

    init() {
        self.data = CellHolder{
            c: emptyCell()
        };
    }
}
