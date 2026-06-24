struct SerializeInts {
    a: Int as int64;
    b: Int as uint8;
    c: Int as coins;
}

contract IntSerialization {
    v: SerializeInts;

    init() {
        self.v = SerializeInts{
            a: -100,
            b: 255,
            c: ton("1")
        };
    }
}