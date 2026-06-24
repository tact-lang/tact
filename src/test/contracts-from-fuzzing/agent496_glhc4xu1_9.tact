struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptBig {
    bigOpt: BigOptional?;

    init() {
        self.bigOpt = null;
    }
}