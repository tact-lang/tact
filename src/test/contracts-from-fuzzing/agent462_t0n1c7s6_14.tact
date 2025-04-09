struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int?;
    j: Bool?;
    k: String?;
    l: Address?;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Address?;
}

contract LargeOptionalContract {
    payload: LargeOptional;

    init() {
        self.payload = LargeOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null,
            n: null,
            o: null,
            p: null
        };
    }
}