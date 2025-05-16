struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract MassOptionals {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{};
    }
}
