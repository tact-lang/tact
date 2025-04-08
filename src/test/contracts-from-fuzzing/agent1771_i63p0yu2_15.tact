struct SerSizes {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int257;
}

contract MixedSerialize {
    data: SerSizes;

    init() {
        self.data = SerSizes{
            a: 1,
            b: -1000,
            c: 12345,
            d: -1,
        };
    }
}