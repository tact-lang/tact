contract ManyFieldsPrimOpt {
    a: Int;
    b: Int?;
    c: Int;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 2;
        self.d = false;
        self.e = "abc";
        self.f = null;
    }
}