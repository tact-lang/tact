struct MixOpt {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptsEverywhere {
    v: MixOpt;

    init() {
        self.v = MixOpt{
            a: null,
            b: null,
            s: null,
            addr: null,
            c: null,
            sl: null
        };
    }
}