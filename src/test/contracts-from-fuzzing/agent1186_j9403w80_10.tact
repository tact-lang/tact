contract OptionalPersistence {
    x: Int?;
    y: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    a: Address?;

    init() {
        self.x = 10;
        self.y = null;
        self.s = "foo";
        self.c = null;
        self.sl = emptyCell().asSlice();
        self.a = null;
    }
}
