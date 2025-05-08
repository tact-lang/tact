struct Big {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Bool?;
    f: String;
    g: Int;
    h: String?;
    i: Bool;
    j: Int?;
}

contract WideStructContract {
    big: Big;

    init() {
        self.big = Big{
            a: 1,
            b: null,
            c: true,
            d: "hello",
            e: false,
            f: "world",
            g: 42,
            h: null,
            i: false,
            j: null,
        };
    }
}

contract U { receive() {} }