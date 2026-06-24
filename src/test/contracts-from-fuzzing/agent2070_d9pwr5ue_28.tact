struct SerialMix {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as coins;
    d: Int;
}

contract SerialTest {
    x: SerialMix;

    init() {
        self.x = SerialMix{
            a: 23,
            b: 1234567890,
            c: ton("1"),
            d: -42
        };
    }
}