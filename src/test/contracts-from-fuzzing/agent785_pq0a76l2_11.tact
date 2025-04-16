contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    ce: Cell?;
    sl: Slice?;
    bd: Builder?;
    ad: Address?;
    init() {
        self.i = 5;
        self.b = null;
        self.s = "text";
        self.ce = null;
        self.sl = emptyCell().asSlice();
        self.bd = null;
        self.ad = myAddress();
    }
}
