contract ManyOptionalDefaults {
    a: Int? = null;
    b: Address? = null;
    c: Bool? = null;
    d: String? = null;
    e: Cell? = null;
    f: Slice? = null;

    init() {
        self.a = 5;
        self.b = myAddress();
        self.c = true;
        self.d = "word";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}