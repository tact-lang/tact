contract OnlySliceCell {
    x: Slice;
    y: Cell;

    init() {
        self.x = emptyCell().asSlice();
        self.y = emptyCell();
    }
}
