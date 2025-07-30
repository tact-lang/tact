contract OptionalFields {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = emptyCell();
        self.d = null;
        self.e = "hello";
    }
}
