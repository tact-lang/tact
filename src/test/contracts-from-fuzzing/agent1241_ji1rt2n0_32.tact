contract SameOptionalTypes {
    i1: Int?;
    i2: Int?;
    i3: Int?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;

    init() {
        self.i1 = null;
        self.i2 = 1;
        self.i3 = null;
        self.b1 = true;
        self.b2 = null;
        self.b3 = false;
    }
}