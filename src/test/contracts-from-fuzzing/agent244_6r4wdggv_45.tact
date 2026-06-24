struct HasCell {
    c: Cell;
}

contract CellFieldTest {
    val: HasCell;

    init() {
        self.val = HasCell{ c: emptyCell() };
    }
}