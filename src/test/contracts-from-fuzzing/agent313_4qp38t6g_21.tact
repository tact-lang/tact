struct WeirdOrder {
    a: Int as uint8;
    b: Bool;
    c: Int as int257;
    d: String;
}

contract SerializationOrderTest {
    val: WeirdOrder;

    init() {
        self.val = WeirdOrder{
            a: 10,
            b: false,
            c: -100,
            d: "test"
        };
    }
}