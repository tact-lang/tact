struct SerialOrder {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Bool;
}

contract SerialTest {
    so: SerialOrder;

    init() {
        self.so = SerialOrder{
            a: 1,
            b: 2,
            c: 3,
            d: true
        };
    }
}
