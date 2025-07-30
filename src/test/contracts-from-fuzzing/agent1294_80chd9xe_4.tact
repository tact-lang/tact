struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptionalFields {
    opts: Opts;

    init() {
        self.opts = Opts{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
