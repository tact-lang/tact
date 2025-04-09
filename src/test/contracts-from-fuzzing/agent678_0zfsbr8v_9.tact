struct Big {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
    g: String?;
}

contract ManyTypes {
    big: Big;

    init() {
        self.big = Big{
            a: 1,
            b: 2,
            c: true,
            d: "s",
            e: null,
            f: false,
            g: null
        };
    }
}
