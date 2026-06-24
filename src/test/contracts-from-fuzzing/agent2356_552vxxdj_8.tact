struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerializedStorage {
    f: SerialTest;

    init() {
        self.f = SerialTest{ a: 255, b: -32768, c: 4294967295 };
    }
}