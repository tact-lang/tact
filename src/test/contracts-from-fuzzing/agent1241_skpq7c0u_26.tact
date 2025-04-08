struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract LotsOpt {
    lo: LargeOptional;

    init() {
        self.lo = LargeOptional{
            a: null, b: null, c: null, d: null, e: null, f: null,
            g: null, h: null, i: null, j: null, k: null, l: null,
        };
    }
}
