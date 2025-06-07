struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
}

contract ChainDeepOpt {
    s: DeepOpt?;

    init() {
        self.s = null;
    }
}