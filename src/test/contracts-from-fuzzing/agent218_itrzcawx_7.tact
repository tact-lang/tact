struct RangeSerialization {
    smallInt: Int as uint4;
    medInt: Int as uint64;
    bigInt: Int as int257;
}

contract SerializedInts {
    data: RangeSerialization;

    init() {
        self.data = RangeSerialization{
            smallInt: 5,
            medInt: 123456789,
            bigInt: -1
        };
    }
}