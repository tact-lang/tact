contract AllOptionals {
    x: Int?;
    y: Bool?;
    z: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.s = null;
        self.c = null;
        self.sl = null;
    }
}