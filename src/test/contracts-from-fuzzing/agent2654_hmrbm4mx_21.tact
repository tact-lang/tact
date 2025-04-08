contract ManyOptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 5;
    e: Bool = false;
    f: String = "ok";

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 10;
        self.e = true;
        self.f = "fine";
    }
}