struct Wide {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
    g: String?;
}

contract WideFields {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1,
            b: 2,
            c: true,
            d: "X",
            e: null,
            f: false,
            g: null
        };
    }
}