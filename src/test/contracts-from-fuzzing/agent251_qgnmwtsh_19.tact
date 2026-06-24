contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 7;
        self.d = null;
        self.e = "x";
        self.f = null;
    }
}