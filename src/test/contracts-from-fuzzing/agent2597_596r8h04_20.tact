contract ManyPersistent {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 11;
        self.b = false;
        self.c = "persist";
        self.d = null;
        self.e = true;
        self.f = null;
    }
}