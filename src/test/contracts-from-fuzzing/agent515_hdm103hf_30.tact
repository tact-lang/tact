// Stress test serialization of many nullable primitives directly
contract ManyOptsDirect {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 3;
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = "end";
    }
}
