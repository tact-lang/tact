contract OptionalComposite {
    s: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.s = null;
        self.addr = null;
        self.c = null;
        self.sl = null;
    }
}
