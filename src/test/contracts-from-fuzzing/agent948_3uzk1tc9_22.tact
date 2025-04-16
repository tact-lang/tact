contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: String?;
    f: String?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = 3;
        self.d = null;
        self.e = "hello";
        self.f = null;
    }
}