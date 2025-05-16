// Compose struct with chain of mixed serialization types
struct SerializeMix {
    a: Int as uint8;
    b: Int as coins;
    c: Int;
    d: Int as int256;
}

contract SerialMixTest {
    s: SerializeMix;

    init() {
        self.s = SerializeMix{
            a: 255,
            b: 10,
            c: 42,
            d: -123,
        };
    }
}
