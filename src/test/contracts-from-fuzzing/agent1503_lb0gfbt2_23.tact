contract MultipleSerializations {
    i1: Int as uint8;
    i2: Int as int257;
    i3: Int;
    i4: Int as coins;

    init() {
        self.i1 = 1;
        self.i2 = -5;
        self.i3 = 123456789;
        self.i4 = 555;
    }

    receive() {}
}