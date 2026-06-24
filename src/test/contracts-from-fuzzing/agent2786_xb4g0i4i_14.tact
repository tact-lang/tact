contract MixedNullableFields {
    i: Int?;
    b: Bool?;
    a: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    
    init() {
        self.i = null;
        self.b = null;
        self.a = null;
        self.s = null;
        self.c = null;
        self.sl = null;
    }
}