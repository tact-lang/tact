struct CellWrapper {
    cl: Cell;
    optCl: Cell?;
}

contract CellTest {
    storage: CellWrapper;
    init() {
        self.storage = CellWrapper {
            cl: emptyCell(),
            optCl: null
        };
    }
}
