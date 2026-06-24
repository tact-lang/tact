struct WideNested {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;
    f: String;
    g: Int?;
    h: Bool;
}

contract HugePersistent {
    wide: WideNested;

    init() {
        self.wide = WideNested{
            a: null,
            b: true,
            c: "abc",
            d: null,
            e: -5,
            f: "xyz",
            g: 123,
            h: false
        };
    }
}