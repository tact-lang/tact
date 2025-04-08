struct DeepOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract LargeOptionBank {
    opts: DeepOptions;

    init() {
        self.opts = DeepOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
