struct SerializeTest {
    a: Int as int64;
    b: Int as uint8;
    c: Int;
}

contract Test {
    s: SerializeTest;
    init() {
        self.s = SerializeTest{ a: -23, b: 255, c: 999 };
    }
}