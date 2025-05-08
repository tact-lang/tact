contract IntSerializations {
    defaultInt: Int; // 257
    smallInt: Int as int8;
    uInt: Int as uint16;
    bigInt: Int as int256;

    init() {
        self.defaultInt = 1;
        self.smallInt = 2;
        self.uInt = 3;
        self.bigInt = 4;
    }
}