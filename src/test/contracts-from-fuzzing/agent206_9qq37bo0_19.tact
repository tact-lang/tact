struct CellStruct {
    one: Cell;
    two: Cell?;
    three: Cell;
    four: Cell?;
    five: Cell;
}

contract CellFieldsTest {
    field: CellStruct;

    init() {
        self.field = CellStruct{
            one: emptyCell(),
            two: null,
            three: emptyCell(),
            four: emptyCell(),
            five: emptyCell()
        };
    }
}
