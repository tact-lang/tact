struct Cells {
    a: Cell;
    b: Cell?;
}

contract CellFields {
    vals: Cells;
    init() {
        self.vals = Cells{
            a: emptyCell(),
            b: null
        };
    }
}