contract OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "Test";
        self.d = emptyCell();
        self.e = myAddress();
    }
}