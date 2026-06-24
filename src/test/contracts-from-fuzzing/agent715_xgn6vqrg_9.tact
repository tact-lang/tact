struct WithCellRefs {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract TestContract {
    data: WithCellRefs;

    init() {
        self.data = WithCellRefs{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}