contract SerializationWidths {
    normalInt: Int;
    smallInt: Int as int8;
    uintVal: Int as uint32;
    bigInt: Int as int257;

    init() {
        self.normalInt = 5;
        self.smallInt = 120;
        self.uintVal = 1000;
        self.bigInt = 3000;
    }
}