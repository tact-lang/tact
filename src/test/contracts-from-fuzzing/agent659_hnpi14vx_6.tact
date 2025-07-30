struct OptionFlood {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Address?;
    f: Cell?;
    g: Slice?;
    h: Builder?;
    i: String?;
    j: String?;
    k: Address?;
    l: Slice?;
    m: Builder?;
    n: Bool?;
    o: Int?;
}

contract TestContract {
    opts: OptionFlood;

    init() {
        self.opts = OptionFlood{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null,
            k: null, l: null, m: null, n: null, o: null,
        };
    }
}