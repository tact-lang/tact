contract RefOptionals {
    a: Address?;
    c: Cell?;
    s: Slice?;

    init() {
        self.a = null;
        self.c = emptyCell();
        self.s = null;
    }
}