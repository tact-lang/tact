contract MixedInitOrder {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.f = null;
        self.e = "x";
        self.d = null;
        self.c = true;
        self.b = null;
        self.a = 123;
    }
}