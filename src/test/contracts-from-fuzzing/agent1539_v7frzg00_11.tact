struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Address?;
}

contract LotsOfOptionals {
    m: ManyOpts;
    init() {
        self.m = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}