struct SerialInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
}

contract SerialIntsTest {
    v: SerialInts;

    init() {
        self.v = SerialInts{
            a: 255,
            b: 65535,
            c: 4294967295
        };
    }
}