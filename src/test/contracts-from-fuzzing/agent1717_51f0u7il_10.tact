contract TestContract {
    i1: Int as int8 = 5;
    i2: Int as uint8 = 2;
    i3: Int as int64 = -100;
    i4: Int as uint16 = 40000;
    i5: Int as coins = ton("1");

    init() {
        self.i1 = 7;
        self.i2 = 3;
        self.i3 = -200;
        self.i4 = 50000;
        self.i5 = ton("2");
    }
}