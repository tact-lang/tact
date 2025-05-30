struct SerializationMix {
    a: Int as uint8 = 1;
    b: Int as int16;
    c: Int? as uint32;
    d: Int as int257 = -5;
}

contract SerializationMixTest {
    data: SerializationMix;

    init() {
        self.data = SerializationMix{
            a: 255,
            b: -32768,
            c: null,
            d: 123
        };
    }
}