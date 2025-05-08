struct InnerSerial {
    small: Int as int8;
    large: Int as uint128;
}

struct OuterSerial {
    inner: InnerSerial;
    flag: Bool;
}

contract MixedSerialSpec {
    data: OuterSerial;

    init() {
        self.data = OuterSerial{
            inner: InnerSerial{
                small: -5,
                large: 123456789123456789123456789,
            },
            flag: true,
        };
    }
}