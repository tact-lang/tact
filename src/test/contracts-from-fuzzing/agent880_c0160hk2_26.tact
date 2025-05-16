struct ComplexSerialization {
    a: Int as uint8;
    b: String;
    c: Bool;
    d: Int as int64;
    e: Bool?;
    f: Int? as uint16;
}

contract SerializeTest {
    state: ComplexSerialization;

    init() {
        self.state = ComplexSerialization{
            a: 5,
            b: "hi",
            c: true,
            d: -456,
            e: false,
            f: null,
        };
    }
}