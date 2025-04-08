contract ManyFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "foo";
        self.f = null;
    }
}