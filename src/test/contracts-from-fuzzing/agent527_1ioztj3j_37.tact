contract ManyDifferentFields {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
    init() {
        self.a = 1;
        self.b = null;
        self.c = "abc";
        self.d = null;
        self.e = true;
        self.f = null;
    }
}