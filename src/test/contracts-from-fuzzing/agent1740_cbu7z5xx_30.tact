struct NestedSerial {
    a: Int as int8;
    b: Int as uint8;
    c: Int as uint16;
    d: Bool;
    e: String;
}

contract SerialTest {
    val: NestedSerial;

    init() {
        self.val = NestedSerial {
            a: -5,
            b: 100,
            c: 30000,
            d: true,
            e: "x"
        };
    }
}