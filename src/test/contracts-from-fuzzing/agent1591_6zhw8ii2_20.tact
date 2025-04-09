contract OptionalCellStr {
    c: Cell?;
    s: String?;

    init() {
        self.c = null;
        self.s = null;
    }

    receive() {
        self.c = self.c;
    }
}