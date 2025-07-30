contract PrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}