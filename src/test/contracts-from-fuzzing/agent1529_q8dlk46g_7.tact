contract ManyOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.x = null;
        self.y = true;
        self.s = null;
        self.a = null;
        self.c = null;
        self.sl = null;
    }
}
