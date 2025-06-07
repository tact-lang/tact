contract StorageOptionals {
    n: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.n = null;
        self.b = null;
        self.s = null;
        self.c = null;
        self.sl = null;
    }
}