struct Mid {
    f: Bool?;
    msg: String?;
}

contract OptMix {
    x: Int?;
    nested: Mid;

    init() {
        self.x = null;
        self.nested = Mid{ f: null, msg: null };
    }
}