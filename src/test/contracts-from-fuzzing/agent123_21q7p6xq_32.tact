contract TestSerializations {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;

    init() {
        self.a = -1234567;
        self.b = 987654321;
        self.c = 1234567890;
    }
}