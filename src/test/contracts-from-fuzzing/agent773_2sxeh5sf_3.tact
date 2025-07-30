struct MultiOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Address?;
    g: Cell?;
}

contract ManyOpts {
    st: MultiOpt = MultiOpt{
        a: null,
        b: 2,
        c: null,
        d: true,
        e: null,
        f: null,
        g: null
    };

    init() {
        self.st = MultiOpt{
            a: 1,
            b: 2,
            c: 3,
            d: false,
            e: "opt",
            f: null,
            g: null
        };
    }

    receive() {
        // no-op
    }
}