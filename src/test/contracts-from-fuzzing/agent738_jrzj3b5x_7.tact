struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract WithDeepOpt {
    s: DeepOpt;

    init() {
        self.s = DeepOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
