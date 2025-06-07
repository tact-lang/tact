contract LargeVarContract {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "A";
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int as uint32 = 5;
    f8: Int as uint64 = 6;
    f9: Int as int128 = 7;
    f10: Int?;

    init() {
        self.f1 = 10;
        self.f2 = false;
        self.f3 = "Hello";
        self.f4 = 42;
        self.f5 = true;
        self.f6 = null;
        self.f7 = 123;
        self.f8 = 456;
        self.f9 = -789;
        self.f10 = null;
    }
}
