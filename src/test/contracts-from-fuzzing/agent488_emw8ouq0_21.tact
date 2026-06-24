contract PersistentIntWithSerialization {
    smallInt: Int as int8;
    bigInt: Int as uint64;
    hugeInt: Int;

    init() {
        self.smallInt = 10;
        self.bigInt = 100;
        self.hugeInt = 1000;
    }
}