struct CellStruct {
    c: Cell;
}

contract CellFieldTest {
    foo: CellStruct;

    init() {
        self.foo = CellStruct{
            c: emptyCell()
        };
    }
}