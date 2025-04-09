contract ManyMixedFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = null;
        self.e = false;
        self.f = null;
    }
}