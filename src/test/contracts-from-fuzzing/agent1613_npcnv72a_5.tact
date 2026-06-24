contract WithOptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.i = null;
        self.b = true;
        self.s = "Hi";
        self.a = null;
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}
