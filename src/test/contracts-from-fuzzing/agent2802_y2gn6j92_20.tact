contract NullDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = beginCell().endCell();
        self.f = beginCell().endCell().asSlice();
    }
}