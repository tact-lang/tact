struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    s: String?;
}

contract TestContract {
    mopt: ManyOpts = ManyOpts{
        a: null,
        b: 1,
        c: null,
        d: 2,
        e: null,
        f: true,
        g: null,
        h: false,
        s: null,
    };

    init() {
        self.mopt = ManyOpts{
            a: 9,
            b: null,
            c: 8,
            d: null,
            e: 7,
            f: null,
            g: true,
            h: null,
            s: "zzz",
        };
    }

    receive() {
        let _ = self.mopt.s;
    }
}