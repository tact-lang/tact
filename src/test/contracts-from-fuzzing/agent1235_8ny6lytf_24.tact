contract VariousSerializations {
    smallInt: Int as uint8;
    bigInt: Int as int257;
    coinsVal: Int as coins;

    init() {
        self.smallInt = 1;
        self.bigInt = 42;
        self.coinsVal = ton("1");
    }
}