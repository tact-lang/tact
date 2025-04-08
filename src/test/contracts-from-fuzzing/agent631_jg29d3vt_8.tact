contract OptCell {
    c: Cell?;

    init() {
        self.c = emptyCell();
    }

    receive() {}
}