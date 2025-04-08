contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: String?;
    f: Bool?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 3;
        self.d = "hi";
        self.e = null;
        self.f = true;
    }
}