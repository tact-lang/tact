struct IntsWithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
    d: Int;
}

contract SerializationMix {
    data: IntsWithSerialization;

    init() {
        self.data = IntsWithSerialization{
            a: 200,
            b: -1000,
            c: 9999,
            d: 1_000_000
        };
    }
}