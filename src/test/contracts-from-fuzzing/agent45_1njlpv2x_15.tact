struct Blob {
    c1: Cell;
    c2: Cell;
}

contract CellPair {
    pair: Blob;

    init() {
        let cc = emptyCell();
        self.pair = Blob{ c1: cc, c2: cc };
    }
}
