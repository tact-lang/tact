contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 3;
        self.d = null;
        self.e = "ok";
    }
}
