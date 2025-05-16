contract OptionalAndNormal {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;

    init() {
        self.a = null;
        self.b = 42;
        self.c = true;
        self.d = false;
    }
}