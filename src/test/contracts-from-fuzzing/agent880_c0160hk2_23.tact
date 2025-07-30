contract SerializationSizes {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as int257;

    init() {
        self.i1 = 1;
        self.i2 = -123;
        self.i3 = 99999;
    }
}