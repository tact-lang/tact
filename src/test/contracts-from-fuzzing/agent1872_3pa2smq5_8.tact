contract ManyPrimitiveFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
    g: String?;
    h: Bool?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "x";
        self.f = "y";
        self.g = null;
        self.h = null;
    }
}