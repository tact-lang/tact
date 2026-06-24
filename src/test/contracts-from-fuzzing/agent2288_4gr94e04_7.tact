contract MixedTypes {
    ui8: Int as uint8;
    i16: Int as int16;
    coinsVal: Int as coins;
    bigInt: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    optInt: Int?;

    init() {
        self.ui8 = 1;
        self.i16 = -100;
        self.coinsVal = 1000;
        self.bigInt = 123456789123456789;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.strVal = "hi";
        self.optInt = null;
    }
}