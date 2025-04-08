contract ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = "ok";
        self.f = null;
    }
}
