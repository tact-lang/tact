struct SerializationMix {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int128;
    d: Bool;
    e: String;
}

contract SerializationStructTest {
    data: SerializationMix;

    init() {
        self.data = SerializationMix{
            a: -5,
            b: 250,
            c: 123456789012,
            d: true,
            e: "mix"
        };
    }
}