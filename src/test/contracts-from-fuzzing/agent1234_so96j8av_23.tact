struct CellTypes {
    c: Cell;
    s: Slice;
}

contract CellFieldsTest {
    stuff: CellTypes;

    init() {
        self.stuff = CellTypes{
            c: emptyCell(),
            s: emptyCell().asSlice(),
        };
    }
}