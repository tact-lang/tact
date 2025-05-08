// Fuzz: many optional primitives together
contract OptPrims {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: String?;
    h: String?;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
    }
}
