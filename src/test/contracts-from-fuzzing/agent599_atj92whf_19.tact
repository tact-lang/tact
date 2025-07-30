struct SerializeTest {
    a: Int as uint8 = 5;
    b: Int as int16 = -100;
    c: Int as uint4 = 8;
}

contract SerializeDefaults {
    s: SerializeTest;
    init() {
        self.s = SerializeTest{};
    }
}