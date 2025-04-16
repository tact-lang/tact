struct CellField {
    c: Cell;
}

contract CellFieldTest {
    f: CellField;

    init() {
        self.f = CellField{c: emptyCell()};
    }
}
