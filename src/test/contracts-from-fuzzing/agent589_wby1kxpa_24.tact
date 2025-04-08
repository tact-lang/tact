contract WithSerializations {
    a: Int as int8 = 0;
    b: Int as uint64 = 0;
    c: Int as coins = 0;

    init() {
        self.a = 5;
        self.b = 7;
        self.c = 100;
    }
}