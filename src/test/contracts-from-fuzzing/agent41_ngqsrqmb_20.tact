struct CellFields {
    a: Cell;
    b: Cell;
    c: Cell;
}

contract CellTest {
    s: CellFields;
    init() {
        self.s = CellFields{
            a: emptyCell(),
            b: emptyCell(),
            c: emptyCell(),
        };
    }
}