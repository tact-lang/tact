struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract Test {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}