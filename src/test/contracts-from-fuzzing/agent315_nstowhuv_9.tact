struct OptionalCells {
    c1: Cell?;
    c2: Cell?;
    c3: Cell?;
}

contract OptCellContract {
    val: OptionalCells;

    init() {
        self.val = OptionalCells{ c1: null, c2: null, c3: null };
    }
}