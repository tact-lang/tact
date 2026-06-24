struct CellCombo {
    a: Cell;
    b: Slice;
    c: Cell?;
    d: Slice?;
}

contract CellsHolder {
    c: CellCombo;
    init() {
        self.c = CellCombo{
            a: emptyCell(),
            b: emptyCell().asSlice(),
            c: null,
            d: null
        };
    }
}