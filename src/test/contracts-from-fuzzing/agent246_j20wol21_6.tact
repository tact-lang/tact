contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;

    init() {
        self.a = 10;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = 20;
    }
}