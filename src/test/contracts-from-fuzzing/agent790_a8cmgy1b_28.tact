contract ZeroLengthSerialization {
    f1: Int as uint1;
    f2: Int as uint1;
    f3: Int as uint1;
    f4: Int as uint1;
    f5: Int as uint1;

    init() {
        self.f1 = 1;
        self.f2 = 0;
        self.f3 = 1;
        self.f4 = 0;
        self.f5 = 1;
    }
}
