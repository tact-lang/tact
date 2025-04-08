contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: String?;

    init() {
        self.a = -1;
        self.b = true;
        self.c = "hello";
        self.d = false;
        self.e = null;
        self.f = "world";
    }
}