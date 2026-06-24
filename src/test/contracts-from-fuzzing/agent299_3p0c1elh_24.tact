struct CellHolder {
    cell: Cell;
}

contract CellInStructTest {
    data: CellHolder;
    init() {
        self.data = CellHolder{cell: emptyCell()};
    }
}