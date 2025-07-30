contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
    e: Int?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 42;
        self.d = false;
        self.e = null;
    }
}