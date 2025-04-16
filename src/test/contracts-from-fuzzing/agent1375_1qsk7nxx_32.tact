contract CellAndOptionalCell {
    a: Cell;
    b: Cell?;

    init() {
        self.a = emptyCell();
        self.b = null;
    }
}