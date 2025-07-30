contract OptionalVsNonOptional {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;

    init() {
        self.a = 10;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}