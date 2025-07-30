struct SerializeTest {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
}

contract ContrFieldSerialization {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            a:5, b:-5, c:300, d:-300,
        };
    }
}