contract OptionalBoolInt {
    a: Bool?;
    b: Int?;
    c: Bool;
    d: Int;

    init() {
        self.a = null;
        self.b = null;
        self.c = true;
        self.d = 7;
    }
}