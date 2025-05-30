struct WithOptions {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract Test {
    storage: WithOptions;

    init() {
        self.storage = WithOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
