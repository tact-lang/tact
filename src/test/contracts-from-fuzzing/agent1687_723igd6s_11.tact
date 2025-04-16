contract OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: Cell? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
    }
}