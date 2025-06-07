contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "hi";
        self.d = 42;
        self.e = true;
        self.f = null;
    }
}
