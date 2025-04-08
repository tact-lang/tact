struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
}

contract WideFields {
    w: Wide;
    init() {
        self.w = Wide{
            a: 1,
            b: true,
            c: "x",
            d: 2,
            e: false,
            f: "y",
            g: 3,
            h: true
        };
    }
}