contract IntSizes {
    i1: Int as int1;
    i255: Int as int255;
    u1: Int as uint1;
    u255: Int as uint255;
    init() {
        self.i1 = -1;
        self.i255 = -(1 << 254);
        self.u1 = 0;
        self.u255 = 1 << 254;
    }
}