struct OptionalCells {
    c1: Cell?;
    c2: Cell?;
    c3: Cell?;
}

contract OptionalCellsContract {
    data: OptionalCells;

    init() {
        self.data = OptionalCells{
            c1: null,
            c2: null,
            c3: null
        };
    }
}
