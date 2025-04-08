contract MixedPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "hello";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}