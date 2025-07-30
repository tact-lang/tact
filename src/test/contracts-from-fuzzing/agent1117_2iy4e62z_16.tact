contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: String;
    f: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = 1;
        self.e = "hello";
        self.f = null;
    }
}
