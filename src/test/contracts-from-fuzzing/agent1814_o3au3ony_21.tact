struct OnlyBoolOpt {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
}

contract AllBoolOpts {
    s: OnlyBoolOpt;

    init() {
        self.s = OnlyBoolOpt{
            a: null,
            b: true,
            c: null,
            d: false,
            e: null
        };
    }
}
