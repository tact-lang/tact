struct SerializeTypes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract SerTypeTest {
    data: SerializeTypes = SerializeTypes{ a: 1, b: -2, c: 10 };

    init() {
        self.data = SerializeTypes{ a: 2, b: -3, c: 20 };
    }
}
