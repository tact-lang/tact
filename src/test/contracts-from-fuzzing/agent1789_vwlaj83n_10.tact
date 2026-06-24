struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int;
}

contract WideStructTest {
    big: Wide;

    init() {
        self.big = Wide{
            a: 1,
            b: true,
            c: "x",
            d: 2,
            e: false,
            f: "y",
            g: null,
            h: null,
            i: null,
            j: 99
        };
    }
}