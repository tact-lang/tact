struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptionalFields {
    opts: ManyOptions;

    init() {
        self.opts = ManyOptions{
            a: null,
            b: true,
            c: "hi",
            d: null
        };
    }
}