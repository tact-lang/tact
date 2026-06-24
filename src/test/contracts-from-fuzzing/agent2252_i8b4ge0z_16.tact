contract MixedOptionalBool {
    a: Bool?;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    init() {
        self.a = null;
        self.b = true;
        self.c = false;
        self.d = null;
        self.e = true;
    }
}