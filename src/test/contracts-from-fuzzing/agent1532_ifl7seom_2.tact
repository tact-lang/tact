struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Int?;
    h: Bool?;
}

contract ManyOptionals {
    optField: ManyOpts;

    init() {
        self.optField = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}
