contract AllOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
    addr: Address?;
    cl: Cell?;
    sl: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.s = null;
        self.addr = null;
        self.cl = null;
        self.sl = null;
    }
}