struct HasCell {
    c: Cell;
}

contract CellStructContract {
    data: HasCell;

    init() {
        self.data = HasCell{ c: emptyCell() };
    }
}