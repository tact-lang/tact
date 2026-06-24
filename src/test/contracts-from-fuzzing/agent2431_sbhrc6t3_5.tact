struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    g: Builder?;
}

contract WideOptional {
    field: ManyOpts;

    init() {
        self.field = ManyOpts{
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