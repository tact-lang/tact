contract SerializationSizes {
    bigInt: Int as int257;
    smallerUInt: Int as uint128;
    tinyInt: Int as int8;
    boolVar: Bool;

    init() {
        self.bigInt = 0;
        self.smallerUInt = 0;
        self.tinyInt = 0;
        self.boolVar = false;
    }
}