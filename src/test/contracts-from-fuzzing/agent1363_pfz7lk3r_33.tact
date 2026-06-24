struct CellOptional {
    cellOpt: Cell?;
}

contract CellOptionalTest {
    s: CellOptional;

    init() {
        self.s = CellOptional{cellOpt: null};
    }
}