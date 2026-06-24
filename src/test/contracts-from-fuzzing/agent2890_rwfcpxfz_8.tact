contract OptionalsInState {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Address?;
    e: Cell?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = emptyCell();
        self.f = null;
    }
}