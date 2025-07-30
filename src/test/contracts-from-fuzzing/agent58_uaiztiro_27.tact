contract DifferentSerialization {
    i1: Int as uint4;
    i2: Int as int16;
    i3: Int as uint8;
    i4: Int as int257;

    init() {
        self.i1 = 8;
        self.i2 = -100;
        self.i3 = 255;
        self.i4 = 0;
    }
}