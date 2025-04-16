struct SWithCell {
    a: Int;
    cellVal: Cell;
}

contract Test {
    s: SWithCell;
    init() {
        self.s = SWithCell{ a: 5, cellVal: emptyCell() };
    }
}