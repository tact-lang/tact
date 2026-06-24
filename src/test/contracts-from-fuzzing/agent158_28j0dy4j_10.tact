contract OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}