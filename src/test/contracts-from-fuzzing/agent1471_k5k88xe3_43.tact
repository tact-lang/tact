contract CellUninitialized {
    data: Cell;

    init() {
        let e = emptyCell();
        self.data = e;
    }
}
