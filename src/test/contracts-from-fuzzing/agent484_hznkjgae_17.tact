contract TestContract {
    f1: Int as uint8 = 1;
    f2: Int as int16 = -2;
    f3: Int as uint32 = 3;
    f4: Int as int64 = -4;
    f5: Int as coins = 5;

    init() {
        self.f1 = 10;
        self.f2 = -20;
        self.f3 = 30;
        self.f4 = -40;
        self.f5 = 50;
    }
}