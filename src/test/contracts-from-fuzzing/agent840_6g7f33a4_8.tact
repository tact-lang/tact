struct Big {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
}

contract BigStructTest {
    big: Big;

    init() {
        self.big = Big{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: 5,
            f: true,
            g: 7,
            h: true,
            i: 9,
            j: false
        };
    }
}
