contract StorageTest {
    bigInt1: Int as int257;
    bigInt2: Int as int257;
    bigInt3: Int as int257;

    smallUint1: Int as uint4;
    smallUint2: Int as uint8;
    smallUint3: Int as uint16;

    optSmallUint1: Int? as uint4;
    optSmallUint2: Int? as uint8;
    optBigInt: Int? as int257;

    init() {
        self.bigInt1 = 0;
        self.bigInt2 = 1;
        self.bigInt3 = 2;
        self.smallUint1 = 3;
        self.smallUint2 = 4;
        self.smallUint3 = 5;
        self.optSmallUint1 = null;
        self.optSmallUint2 = null;
        self.optBigInt = null;
    }
}