struct Wide {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;
    e: String;
    f: Int as uint8;
    g: Int as int64;
    h: Bool?;
    i: Int?;
    j: String;
}

contract WideStructTest {
    big: Wide;

    init() {
        self.big = Wide{
            a: 1,
            b: true,
            c: null,
            d: 10,
            e: "hello",
            f: 2,
            g: 3,
            h: false,
            i: null,
            j: "world"
        };
    }
}