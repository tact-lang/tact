struct S1 {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int64;
}

contract SerializationMixTest {
    data: S1;

    init() {
        self.data = S1{a: 8, b: 240, c: 65535, d: 4000000000, e: -5000000000};
    }
}