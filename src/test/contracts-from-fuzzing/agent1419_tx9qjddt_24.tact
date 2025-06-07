struct IntSerialize {
    bigInt: Int;
    smallUInt: Int as uint4;
    signedInt8: Int as int8;
}

contract IntSerializeContract {
    s: IntSerialize;

    init() {
        self.s = IntSerialize{
            bigInt: 12345,
            smallUInt: 9,
            signedInt8: -10
        };
    }
}