struct IntWithManySerials {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
}

contract IntSerializationVariants {
    payload: IntWithManySerials;

    init() {
        self.payload = IntWithManySerials{
            a: 255,
            b: -123456789,
            c: 123456789012345678901234567890,
        };
    }
}