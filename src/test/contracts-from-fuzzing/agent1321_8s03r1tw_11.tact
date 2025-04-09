struct SerializeMix {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint4;
    d: Int as int257;
    e: Int;
}

contract MixSerial {
    s: SerializeMix;
    init() {
        self.s = SerializeMix{ a: 1, b: -64, c: 7, d: 123456789, e: 42 };
    }
}