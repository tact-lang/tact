struct SerialMixed {
    a: Int as uint8;
    b: Int;
    c: Int as int64;
    d: Bool;
    e: String;
    f: Bool?;
    g: Int?;
}

contract SerialMixedTest {
    s: SerialMixed;

    init() {
        self.s = SerialMixed{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: "abc",
            f: null,
            g: 7,
        };
    }
}
