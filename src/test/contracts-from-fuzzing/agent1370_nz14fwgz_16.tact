struct Big {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool;
    f: String;
    g: Int;
    h: Bool?;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Int?;
}

contract ComplexStorage {
    big: Big;

    init() {
        self.big = Big{
            a: 1,
            b: false,
            c: null,
            d: "abc",
            e: true,
            f: "def",
            g: 2,
            h: null,
            i: "ghi",
            j: 3,
            k: true,
            l: "jkl",
            m: null
        };
    }
}