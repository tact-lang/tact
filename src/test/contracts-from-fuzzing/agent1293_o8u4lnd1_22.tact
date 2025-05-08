struct InnerCell {
    c: Cell;
}

struct NestedCells {
    cell1: Cell;
    sub: InnerCell;
    cell2: Cell;
}

contract CellsDeep {
    payload: NestedCells;
    extra: Cell;

    init() {
        self.payload = NestedCells{
            cell1: emptyCell(),
            sub: InnerCell{ c: emptyCell() },
            cell2: emptyCell()
        };
        self.extra = emptyCell();
    }
}