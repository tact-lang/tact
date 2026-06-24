struct CellContainer {
    c: Cell;
}

contract WithCell {
    x: CellContainer;
    init() {
        self.x = CellContainer{c: emptyCell()};
    }
}