struct Limits {
    smallInt: Int as int8;
    largeUint: Int as uint128;
}

contract NestedSerialization {
    data: Limits;

    init() {
        self.data = Limits{
            smallInt: 127,
            largeUint: 123456789012345678901234567890
        };
    }
}
