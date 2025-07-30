contract SerializationFormats {
    i1: Int as int8;
    i2: Int as uint64;
    i3: Int as int257;

    init() {
        self.i1 = -100;
        self.i2 = 100;
        self.i3 = 123456789;
    }
}