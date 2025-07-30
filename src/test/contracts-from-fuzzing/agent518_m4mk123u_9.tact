struct SerializedMix {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int4;
    e: Int as uint1;
    f: Int; // defaults to int257
}

contract SerializedTest {
    packed: SerializedMix;

    init() {
        self.packed = SerializedMix{
            a: 255,
            b: -1234,
            c: 429496729,
            d: -7,
            e: 1,
            f: 42,
        };
    }
}