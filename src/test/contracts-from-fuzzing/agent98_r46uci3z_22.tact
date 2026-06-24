contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 42;
        self.d = null;
        self.e = null;
        self.f = "text";
    }
}