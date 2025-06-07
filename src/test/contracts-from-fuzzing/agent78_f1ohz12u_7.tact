struct ManyOpts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract OptionalFields {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: 42,
            e: "test",
            f: true
        };
    }
}