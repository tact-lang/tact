struct CellS {
    a: Cell;
    b: Cell?;
}

contract TestCellTypes {
    val: CellS;
    init() {
        self.val = CellS{
            a: emptyCell(),
            b: null,
        };
    }
}