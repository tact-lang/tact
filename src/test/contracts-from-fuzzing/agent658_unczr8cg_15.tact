contract OptionalMany {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;

    init() {
        self.i1 = null;
        self.i2 = 1;
        self.b1 = null;
        self.b2 = true;
    }
}