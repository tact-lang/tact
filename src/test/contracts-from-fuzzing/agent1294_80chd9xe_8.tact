struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: Bool?;
    h: String?;
    i: String?;
    j: Cell?;
    k: Cell?;
    l: Slice?;
    m: Slice?;
    n: Address?;
    o: Address?;
}

contract OptionalHeap {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, 
            f: null, g: null, h: null, i: null, j: null, 
            k: null, l: null, m: null, n: null, o: null
        };
    }
}
