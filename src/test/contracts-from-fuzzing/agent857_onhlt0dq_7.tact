struct Big {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

contract Test {
    big: Big;

    init() {
        self.big = Big{
            a: 1,
            b: "bb",
            c: true,
            d: null,
            e: "ee",
            f: null,
            g: 7,
            h: "hh",
            i: false,
            j: null
        };
    }
}