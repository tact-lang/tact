struct SerializeMix {
    a: Int as uint16;
    b: Int as int32;
    c: Int;
}
contract SerializeMixTest {
    v: SerializeMix;

    init() {
        self.v = SerializeMix{ a: 1, b: -2, c: 3 };
    }
}