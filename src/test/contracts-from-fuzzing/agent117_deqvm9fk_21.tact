contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;

    init() {
        self.a = null;
        self.b = 5;
        self.c = false;
        self.d = null;
        self.e = "hello";
        self.f = null;
    }
}
