struct SerInts {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
}

contract IntSerializeTest {
    val: SerInts;
    init() {
        self.val = SerInts{ a:1, b:-1, c:10, d:-10 };
    }
}
