struct HasCell {
    cell: Cell;
}

contract CellField {
    d: HasCell;
    init() {
        self.d = HasCell{ cell: emptyCell() };
    }
}