contract MixedFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}