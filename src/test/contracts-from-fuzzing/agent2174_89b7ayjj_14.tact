struct SerializeMix {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as coins;
}

contract MixedSerialization {
    data: SerializeMix;
    init() {
        self.data = SerializeMix{
            a: 1,
            b: 256,
            c: -42,
            d: 1000
        };
    }
}
