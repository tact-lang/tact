contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = 42;
        self.e = null;
        self.f = "hi";
    }
}