struct CellRefs {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract TestContract {
    data: CellRefs;

    init() {
        self.data = CellRefs{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}
