contract SerializeAll {
    si: Int as int64;
    ui: Int as uint64;
    coinsVal: Int as coins;

    init() {
        self.si = -12345;
        self.ui = 67890;
        self.coinsVal = 1000000000;
    }
}