struct JustCell {
    c: Cell;
}

contract CellStructField {
    val: JustCell;

    init() {
        self.val = JustCell{ c: emptyCell() };
    }
}
