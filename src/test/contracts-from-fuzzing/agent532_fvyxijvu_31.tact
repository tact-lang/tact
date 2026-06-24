struct WithCell {
    c: Cell;
    r: Cell;
    d: Cell;
}

contract MultiCellStorage {
    data: WithCell;

    init() {
        let empty = emptyCell();
        self.data = WithCell{
            c: empty,
            r: empty,
            d: empty
        };
    }
}