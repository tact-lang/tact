struct CellPair {
    c1: Cell;
    c2: Cell;
}

contract CellStore {
    pair: CellPair;

    init() {
        self.pair = CellPair{
            c1: emptyCell(),
            c2: emptyCell()
        };
    }

    receive() {
        self.pair = self.pair;
    }
}