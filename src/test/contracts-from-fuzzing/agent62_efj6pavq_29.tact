contract DifferentSerializations {
    s1: Int as uint8;
    s2: Int as int64;
    s3: Int as coins;
    s4: Int as int257;

    init() {
        self.s1 = 1;
        self.s2 = 2;
        self.s3 = 3;
        self.s4 = 4;
    }
}