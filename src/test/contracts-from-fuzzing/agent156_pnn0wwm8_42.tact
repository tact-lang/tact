contract OptionalBools {
    a: Bool?;
    b: Bool?;
    c: Bool?;

    init() {
        self.a = true;
        self.b = null;
        self.c = false;
    }
}
