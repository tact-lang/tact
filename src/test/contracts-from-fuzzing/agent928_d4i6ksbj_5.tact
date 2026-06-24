contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "s";
        self.d = 10;
        self.e = null;
        self.f = "x";
    }
}