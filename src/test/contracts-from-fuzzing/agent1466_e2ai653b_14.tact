struct Basic {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerializeTest {
    data: Basic = Basic{ a: 5, b: -10, c: 100 };

    init() {
        self.data = Basic{ a: 10, b: 20, c: 200 };
    }
}
