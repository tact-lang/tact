struct OptionalCells {
    a: Cell?;
    b: Cell?;
    flag: Bool;
}

contract OptionalCellsTest {
    s: OptionalCells;
    init() {
        self.s = OptionalCells{
            a: null,
            b: null,
            flag: false,
        };
    }
}