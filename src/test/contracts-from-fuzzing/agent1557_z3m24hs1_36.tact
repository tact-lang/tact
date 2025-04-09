contract SerialSpec {
    i1: Int as uint1;
    i2: Int as uint8;
    i3: Int as int16;
    i4: Int as int257;

    init() {
        self.i1 = 1;
        self.i2 = 5;
        self.i3 = -16;
        self.i4 = -256;
    }
}