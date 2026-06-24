contract OptionalFieldsDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: Cell? = null;
    e: Builder? = null;
    f: Slice? = null;
    g: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = beginCell();
        self.f = emptyCell().asSlice();
        self.g = "hi";
    }
}