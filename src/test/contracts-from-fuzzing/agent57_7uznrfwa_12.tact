contract FieldsWithSerialization {
    int4: Int as int4;
    uint16: Int as uint16;
    bigInt: Int as int257;
    coinsAmount: Int as coins;
    
    init() {
        self.int4 = 7;
        self.uint16 = 65000;
        self.bigInt = 12345678901234567890;
        self.coinsAmount = 1000000000;
    }
}