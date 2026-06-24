struct CellMix {
    c1: Cell;
    c2: Cell?;
    c3: Cell;
    c4: Cell?;
}

contract CellStorage {
    data: CellMix;

    init() {
        self.data = CellMix{
            c1: emptyCell(),
            c2: null,
            c3: emptyCell(),
            c4: null
        };
    }
}
