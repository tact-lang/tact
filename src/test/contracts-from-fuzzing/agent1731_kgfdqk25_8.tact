struct S {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract Test {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: null,
            c: null,
            d: 4,
            e: null,
            f: 6,
            g: null,
            h: 8,
            i: 9,
            j: null
        };
    }
}
