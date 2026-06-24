contract OnlyPrimitives {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool;
    i3: Int;
    i4: Int?;

    init() {
        self.i1 = 1;
        self.i2 = null;
        self.b1 = true;
        self.b2 = false;
        self.i3 = 3;
        self.i4 = null;
    }
}
