struct LargeOptional {
    a: Int?;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
    g: Int;
    h: Int?;
    i: Int;
    j: Int?;
    k: Int;
    l: Int?;
}

contract LargeOptTest {
    s: LargeOptional;
    init() {
        self.s = LargeOptional{
            a: null,
            b: 2,
            c: 3,
            d: null,
            e: 5,
            f: 6,
            g: 7,
            h: null,
            i: 9,
            j: null,
            k: 11,
            l: 12
        };
    }
}