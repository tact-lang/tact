struct CellCombo {
    data: Cell;
    meta: Slice?;
}

contract CellTest {
    s: CellCombo;
    init() {
        self.s = CellCombo{ data: emptyCell(), meta: null };
    }
}