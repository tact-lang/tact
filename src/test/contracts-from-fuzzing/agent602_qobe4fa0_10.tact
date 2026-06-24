contract TestContract {
    f1: Int as uint8 = 1;
    f2: Int as int16 = -2;
    f3: Int as uint4 = 3;
    f4: Int as int64 = -4;
    f5: Int as uint256 = 5;
    f6: Int as int257 = -6;
    f7: Bool = false;
    f8: Bool? = null;
    f9: String = "abc";
    f10: String? = null;

    init() {
        self.f1 = 11;
        self.f2 = -22;
        self.f3 = 7;
        self.f4 = -44;
        self.f5 = 5555;
        self.f6 = -6666;
        self.f7 = true;
        self.f8 = true;
        self.f9 = "zzz";
        self.f10 = "qqq";
    }
}