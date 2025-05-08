struct SerialOrder {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint256;
}

contract SerializationTest {
    so: SerialOrder;

    init() {
        self.so = SerialOrder{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
        };
    }
}
