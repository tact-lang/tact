struct SerializationMix {
    a: Int as uint4;
    b: Int as int64;
    c: Int as uint250;
    d: Bool;
    e: String;
}

contract SerializationMixed {
    rec: SerializationMix;

    init() {
        self.rec = SerializationMix{
            a: 7,
            b: -123456,
            c: 123456789012345,
            d: true,
            e: "serialize"
        };
    }
}