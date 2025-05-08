struct OptionalDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptStruct {
    opts: OptionalDeep;

    init() {
        self.opts = OptionalDeep {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}