struct ContainsCell {
    c: Cell;
}

contract CellFieldContract {
    field: ContainsCell;

    init() {
        self.field = ContainsCell{ c: emptyCell() };
    }
}