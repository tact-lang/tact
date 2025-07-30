contract TopLevelOptionals {
    a: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.a = null;
        self.s = null;
        self.c = null;
        self.sl = null;
    }
}
