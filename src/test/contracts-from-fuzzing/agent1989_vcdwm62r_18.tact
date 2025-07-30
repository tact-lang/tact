struct CellHolder {
    c1: Cell;
    c2: Cell?;
    c3: Cell;
}

contract CellPersist {
    payloads: CellHolder;

    init() {
        self.payloads = CellHolder{
            c1: emptyCell(),
            c2: null,
            c3: emptyCell(),
        };
    }
}