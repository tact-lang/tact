contract PersistentCell {
    c: Cell;
    init() {
        self.c = beginCell().endCell();
    }
}