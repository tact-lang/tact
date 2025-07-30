struct LongFlat {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int;
    f: Int?;
    g: Bool;
    h: Bool?;
    i: Int;
    j: Int?;
    k: Bool;
    l: Bool?;
    m: Int;
    n: Int?;
    o: Bool;
    p: Bool?;
}

contract TestContract {
    data: LongFlat;

    init() {
        self.data = LongFlat{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: 2,
            f: null,
            g: true,
            h: null,
            i: 3,
            j: 10,
            k: false,
            l: null,
            m: 4,
            n: null,
            o: true,
            p: false
        };
    }
}