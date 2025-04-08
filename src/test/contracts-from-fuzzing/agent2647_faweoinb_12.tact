contract OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "str";
        self.d = myAddress();
        self.e = emptyCell();
    }
}