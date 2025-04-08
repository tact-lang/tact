struct HasCells {
    c: Cell;
    co: Cell?;
}

contract CellsTest {
    a: HasCells;

    init() {
        self.a = HasCells{ c: emptyCell(), co: null };
    }
}