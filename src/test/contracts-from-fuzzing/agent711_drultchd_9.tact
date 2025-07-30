struct CellNested {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

struct OuterCell {
    inner: CellNested;
    suffix: Int;
}

contract TestContract {
    data: OuterCell;

    init() {
        self.data = OuterCell{
            inner: CellNested{
                c1: emptyCell(),
                c2: emptyCell(),
                c3: emptyCell(),
            },
            suffix: 42,
        };
    }
}