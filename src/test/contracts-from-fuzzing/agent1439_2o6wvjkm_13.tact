struct CellTypes {
    a: Cell;
    b: Cell;
}

contract CellStorage {
    c: CellTypes;

    init() {
        self.c = CellTypes{a:emptyCell(), b:emptyCell()};
    }
}