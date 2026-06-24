contract MixedSerialization {
    i1: Int as int64;
    i2: Int as uint32;
    i3: Int as uint12;
    i4: Int;
    b: Bool;

    init() {
        self.i1 = 123456789;
        self.i2 = 42;
        self.i3 = 2047;
        self.i4 = -1;
        self.b = true;
    }
}
