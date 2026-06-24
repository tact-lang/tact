struct OptCells {
    a: Cell?;
    b: Cell?;
    c: Cell?;
}

contract StorageTest {
    data: OptCells;

    init() {
        self.data = OptCells{
            a: emptyCell(),
            b: null,
            c: emptyCell()
        };
    }
}