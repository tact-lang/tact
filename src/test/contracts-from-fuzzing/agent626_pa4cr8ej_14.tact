contract OptionalsTopLevel {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Bool?;

    init() {
        self.a = null;
        self.b = "hi";
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = false;
    }
}