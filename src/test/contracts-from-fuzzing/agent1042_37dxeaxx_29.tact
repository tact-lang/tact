struct HasCell {
    c: Cell;
}

contract CellStructField {
    d: HasCell;
    init() {
        self.d = HasCell{c: emptyCell()};
    }
}