struct HasCells {
    c1: Cell;
    c2: Cell?;
}

contract Test19 {
    data: HasCells;

    init() {
        self.data = HasCells{
            c1: emptyCell(),
            c2: null
        };
    }
}