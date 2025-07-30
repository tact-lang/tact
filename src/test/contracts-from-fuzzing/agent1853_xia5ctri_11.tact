struct SerializeTypes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint128;
    d: Int as int64;
}

contract SerializeStorage {
    data: SerializeTypes;

    init() {
        self.data = SerializeTypes{
            a: 255,
            b: -32768,
            c: 1 << 127,
            d: -123456789,
        };
    }
}