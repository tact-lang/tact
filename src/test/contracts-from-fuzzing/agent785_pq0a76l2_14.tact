contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: Builder? = null;
    g: Address? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "string";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
    }
}
