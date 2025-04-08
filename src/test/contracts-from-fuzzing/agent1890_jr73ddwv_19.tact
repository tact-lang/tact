struct OptOptions {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract ContractOptOptions {
    opts: OptOptions;

    init() {
        self.opts = OptOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}