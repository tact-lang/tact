contract OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: Address? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}