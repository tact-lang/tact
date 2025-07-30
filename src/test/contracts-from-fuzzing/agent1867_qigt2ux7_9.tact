contract PrimitiveFields {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;
    e: String;
    f: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = 5;
        self.e = "hi";
        self.f = null;
    }
}