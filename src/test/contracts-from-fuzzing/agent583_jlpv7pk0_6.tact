struct LotsOptionals {
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

contract BigOptionals {
    s: LotsOptionals;

    init() {
        self.s = LotsOptionals{
            a: null, b: true, c: null, d: null, e: null, f: null,
            g: 1, h: null, i: null, j: null, k: null, l: null
        };
    }
}