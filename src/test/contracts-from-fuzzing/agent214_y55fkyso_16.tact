contract ManyOptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    
    init() {
        self.i = 1;
        self.b = null;
        self.s = null;
        self.a = null;
        self.c = null;
        self.sl = null;
    }
}
