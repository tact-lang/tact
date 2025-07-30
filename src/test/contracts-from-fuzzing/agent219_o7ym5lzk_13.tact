contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 77;
        self.e = "test";
    }
}