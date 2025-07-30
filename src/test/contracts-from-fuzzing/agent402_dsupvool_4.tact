struct Wide {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract TestContract {
    wide: Wide;

    init() {
        self.wide = Wide{
            a: 1,
            b: false,
            c: myAddress(),
            d: "hi",
            e: null,
            f: null,
            g: null,
            h: null,
        };
    }
}