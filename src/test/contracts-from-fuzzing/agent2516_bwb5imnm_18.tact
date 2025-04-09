contract NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = null;
        self.d = myAddress();
        self.e = emptyCell();
    }
}