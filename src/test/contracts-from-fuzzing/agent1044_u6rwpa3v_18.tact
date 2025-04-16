contract PackedPrimitives {
    i1: Int as uint8;
    i2: Int as uint32;
    i3: Int as int64;
    b: Bool;
    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.b = true;
    }
}