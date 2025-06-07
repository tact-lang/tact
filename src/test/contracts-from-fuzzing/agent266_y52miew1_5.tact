struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

contract OptionalFields {
    opts: ManyOptions;

    init() {
        self.opts = ManyOptions{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: "test",
        };
    }
}