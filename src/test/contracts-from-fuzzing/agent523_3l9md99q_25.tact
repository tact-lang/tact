contract BoolIntOptionalMix {
    b: Bool;
    i: Int;
    ob: Bool?;
    oi: Int?;
    s: String?;
    init() {
        self.b = true;
        self.i = 10;
        self.ob = null;
        self.oi = null;
        self.s = null;
    }
}