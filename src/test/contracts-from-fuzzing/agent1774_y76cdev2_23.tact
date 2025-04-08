contract OnlyOptionalBools {
    a: Bool?;
    b: Bool?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = false;
    }
}
