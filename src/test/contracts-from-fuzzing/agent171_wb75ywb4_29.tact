struct CellHolder {
    data: Cell;
}

contract CellFieldTest {
    val: CellHolder;
    init() {
        self.val = CellHolder{ data: emptyCell() };
    }
}