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
        self.c = null;
        self.d = 7;
        self.e = true;
        self.f = "test";
    }
}