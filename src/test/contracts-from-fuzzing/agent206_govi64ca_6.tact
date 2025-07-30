contract JustLotsOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hi";
    }
}
