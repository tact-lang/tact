contract MixFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool?;
    g: Int?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = 2;
        self.d = null;
        self.e = 3;
        self.f = true;
        self.g = null;
    }
}