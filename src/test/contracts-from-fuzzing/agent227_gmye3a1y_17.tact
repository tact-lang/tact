struct CellTest {
    a: Cell;
    b: Cell?;
}

contract TestContract {
    dat: CellTest;

    init() {
        self.dat = CellTest{ a: emptyCell(), b: null };
    }
}