struct SerialOrder {
    a: Int as uint32;
    b: Int;
    c: Int as int64;
}

contract MixedSerial {
    s: SerialOrder;

    init() {
        self.s = SerialOrder{ a:1, b:2, c:3 };
    }
}