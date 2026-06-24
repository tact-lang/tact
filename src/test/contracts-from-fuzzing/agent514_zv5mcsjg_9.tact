struct MixedSizes {
    a: Int as int64;
    b: Int as uint8;
    c: Int as int257;
    d: Bool;
}

contract MixedSerializations {
    data: MixedSizes = MixedSizes{
        a: 123456789,
        b: 255,
        c: -1234567890123456789,
        d: true,
    };

    init() {
        self.data = MixedSizes{
            a: -1,
            b: 0,
            c: 99999999999,
            d: false,
        };
    }
}