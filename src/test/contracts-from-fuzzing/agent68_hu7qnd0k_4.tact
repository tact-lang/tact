struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
}

contract OptionalsStruct {
    s: ManyOpts;

    init() {
        self.s = ManyOpts{
            a: null,
            b: true,
            c: 42,
            d: null,
            e: null
        };
    }
}
