struct SerialOrder1 {
    a: Int as int32;
    b: Int as uint8;
    c: Bool;
}

struct SerialOrder2 {
    c: Bool;
    b: Int as uint8;
    a: Int as int32;
}

contract SerializationOrderTest {
    s1: SerialOrder1;
    s2: SerialOrder2;

    init() {
        self.s1 = SerialOrder1{ a: -123456, b: 255, c: true };
        self.s2 = SerialOrder2{ a: -123456, b: 255, c: true };
    }

    receive() {}
}