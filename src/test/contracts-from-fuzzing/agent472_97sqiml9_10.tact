contract PrimitiveOptionals {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
    c: Cell? = null;
    a: Address? = null;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "hi";
        self.c = emptyCell();
        self.a = myAddress();
    }
}