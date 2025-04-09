struct SerialOrder {
    first: Int as uint8;
    second: Int as uint16;
    third: Int as uint32;
    fourth: Int as int64;
}

contract SerializationTest {
    s: SerialOrder;

    init() {
        self.s = SerialOrder{
            first: 5,
            second: 500,
            third: 70000,
            fourth: -123456789
        };
    }
}