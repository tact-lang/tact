struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract TestOptionals {
    opts: ManyOpts;
    init() {
        self.opts = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}