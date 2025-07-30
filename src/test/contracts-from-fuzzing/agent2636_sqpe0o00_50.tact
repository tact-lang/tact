struct OptionalCell {
    c: Cell?;
}

contract OptCellTest {
    data: OptionalCell;

    init() {
        self.data = OptionalCell{ c: emptyCell() };
    }
}