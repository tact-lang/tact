struct SerialFormats {
    a: Int as uint4;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
}

contract SerializationTest {
    f: SerialFormats;

    init() {
        self.f = SerialFormats{ a: 1, b: -2, c: 3, d: -4 };
    }
}