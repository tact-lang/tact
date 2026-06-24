contract MultipleOptionTypes {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Builder?;

    init() {
        self.a = 123;
        self.b = true;
        self.c = null;
        self.d = "hi";
        self.e = null;
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}