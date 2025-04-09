contract OptionalPrimitivesDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;
    g: Builder? = null;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "foo";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}