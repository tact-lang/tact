contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    e: Cell? = null;
    f: Slice? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hi";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}