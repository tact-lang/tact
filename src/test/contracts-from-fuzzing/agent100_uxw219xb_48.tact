contract WeirdSerializations {
    f1: Int as int3;
    f2: Int as uint7;
    f3: Int as int31;
    f4: Int as uint24;

    init() {
        self.f1 = 3;
        self.f2 = 5;
        self.f3 = 99;
        self.f4 = 77;
    }
}