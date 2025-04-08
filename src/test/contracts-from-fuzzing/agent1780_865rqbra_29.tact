contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: Address?;
    d: Slice?;
    e: Cell?;

    init() {
        self.a = 42;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
    }
}