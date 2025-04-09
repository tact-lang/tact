struct SerializeMix {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int64;
    e: Int as uint256;
}

contract SerializeMixContract {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            a: 5,
            b: -5,
            c: 500,
            d: -123456789,
            e: 12345678901234567890,
        };
    }
}