contract WeirdSerializations {
    i1: Int as uint1;
    i9: Int as int9;
    i17: Int as uint17;
    i33: Int as int33;

    init() {
        self.i1 = 1;
        self.i9 = -3;
        self.i17 = 12345;
        self.i33 = -1234567;
    }
}