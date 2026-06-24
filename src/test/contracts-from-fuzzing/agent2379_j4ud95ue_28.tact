contract MixedOrder {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String;

    init() {
        self.a = 1; self.b = null; self.c = true;
        self.d = null; self.e = null; self.f = "z";
    }
}