struct CellCombo {
    c: Cell;
    s: Slice;
    co: Cell?;
    so: Slice?;
}

contract CellsMix {
    stuff: CellCombo;

    init() {
        self.stuff = CellCombo{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            co: null,
            so: null
        };
    }
}