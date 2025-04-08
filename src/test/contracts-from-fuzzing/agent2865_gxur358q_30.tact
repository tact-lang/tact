contract BoolOptionalCrazy {
    a: Bool?;
    b: Bool;
    c: Bool?;
    d: Bool;

    init() {
        self.a = null;
        self.b = true;
        self.c = false;
        self.d = false;
    }
}