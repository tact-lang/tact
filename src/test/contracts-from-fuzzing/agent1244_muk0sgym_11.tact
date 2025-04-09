struct SerialInts {
    bigInt: Int as int257;
    smallUInt: Int as uint8;
    midInt: Int as int64;
    medUInt: Int as uint32;
}

contract SerializedIntsStorage {
    data: SerialInts;

    init() {
        self.data = SerialInts{
            bigInt: 123456789012345678901234567890,
            smallUInt: 255,
            midInt: -1234567890,
            medUInt: 1234567890,
        };
    }
}
