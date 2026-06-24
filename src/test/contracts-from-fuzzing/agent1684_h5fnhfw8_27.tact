contract OptionalCellSetInit {
    c: Cell?;

    init() {
        self.c = emptyCell();
    }
}