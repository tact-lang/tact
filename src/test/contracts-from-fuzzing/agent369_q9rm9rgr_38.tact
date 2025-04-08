contract OptionalStringBools {
    s: String?;
    b1: Bool?;
    b2: Bool?;

    init() {
        self.s = null;
        self.b1 = true;
        self.b2 = null;
    }
}