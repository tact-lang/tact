contract LargeIntScalars {
    f1: Int as int1;
    f2: Int as int64;
    f3: Int as int128;
    f4: Int as int256;
    f5: Int as int257;
    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
    }
}