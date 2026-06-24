struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
    g: Int?;
    h: Bool?;
    i: Int?;
    j: Bool?;
}

contract LotsOfOptionals {
    persist: ManyOpts;

    init() {
        self.persist = ManyOpts{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null
        };
    }
}