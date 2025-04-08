struct SerializationTest {
    bigInt: Int as uint256;
    smallInt: Int as int8;
    tinyUInt: Int as uint4;
    coinsVal: Int as coins;
    normalInt: Int;
}

contract TestSerialization {
    s: SerializationTest;

    init() {
        self.s = SerializationTest{
            bigInt: 1234567890,
            smallInt: -5,
            tinyUInt: 9,
            coinsVal: 1000000000,
            normalInt: 42
        };
    }
}