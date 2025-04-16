contract CellFieldInitInInit {
    f: Cell;

    init() {
        self.f = emptyCell();
    }
}