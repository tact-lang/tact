contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = 3;
        self.d = null;
        self.e = true;
        self.f = null;
    }
}