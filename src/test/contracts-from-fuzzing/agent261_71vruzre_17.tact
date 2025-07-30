contract LargeOptionalSet {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Bool?;
    h: Int?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = true;
        self.h = null;
    }
    
    receive() {
        let _ = self.a;
    }
}