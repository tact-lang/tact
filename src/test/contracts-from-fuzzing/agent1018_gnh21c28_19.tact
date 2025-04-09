contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: String?;
    e: Bool?;
    f: Bool?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = "text";
        self.e = true;
        self.f = null;
    }
}