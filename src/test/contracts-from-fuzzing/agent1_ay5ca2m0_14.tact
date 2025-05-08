contract OptDefaults {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
    c: Cell? = null;
    addr: Address? = null;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "hello";
        self.c = emptyCell();
        self.addr = myAddress();
    }
}
