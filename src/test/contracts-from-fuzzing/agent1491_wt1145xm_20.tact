contract BoolAndSerialization {
    b1: Bool;
    b2: Bool;
    i1: Int as uint1;
    i2: Int as int1;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.i1 = 1;
        self.i2 = -1;
    }
}