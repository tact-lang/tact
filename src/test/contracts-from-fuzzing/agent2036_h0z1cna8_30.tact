contract Test {
    f1: Cell;
    f2: Cell?;

    init() {
        self.f1 = emptyCell();
        self.f2 = null;
    }
}