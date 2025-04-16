contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;
    a: Address?;

    init() {
        self.i = 5;
        self.b = true;
        self.s = "abc";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
        self.a = myAddress();
    }
}