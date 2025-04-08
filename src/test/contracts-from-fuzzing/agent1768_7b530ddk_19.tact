struct IntManyWidths {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;
}

contract TestStorage {
    data: IntManyWidths;

    init() {
        self.data = IntManyWidths{
            a: 255,
            b: -32768,
            c: 1234567890,
            d: -123456789012345,
            e: 340282366920938463463374607431768211455,
            f: -57896044618658097711785492504343953926634992332820282019728792003956564819967
        };
    }
}