struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    s1: String?;
    s2: String?;
}

contract LotsOfOptionals {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a: null, b: null, c: null,
            d: null, e: null, f: null,
            s1: null, s2: null
        };
    }
}