contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.c = "abc";
        self.d = myAddress();
        self.e = emptyCell();
    }
}