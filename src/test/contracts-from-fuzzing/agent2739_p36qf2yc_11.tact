contract DefaultOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.c = null;
        self.sl = null;
        self.a = null;
    }
}