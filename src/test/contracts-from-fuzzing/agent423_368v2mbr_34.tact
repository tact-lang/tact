contract MixedOptionals {
    a: Int?;
    b: Bool?;
    c: Int;
    d: Bool;
    init() {
        self.a = null;
        self.b = true;
        self.c = 7;
        self.d = false;
    }
}