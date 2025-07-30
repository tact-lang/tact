struct ManyOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
}

contract OptCascade {
    s: ManyOpt;

    init() {
        self.s = ManyOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: true,
        };
    }
}
