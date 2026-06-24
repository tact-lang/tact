contract VariousOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "X";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}