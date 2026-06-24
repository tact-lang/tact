struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Builder?;
    n: Address?;
}

contract PackedOpts {
    opts: ManyOptionals;

    init() {
        self.opts = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null,
            h:null, i:null, j:null, k:null, l:null, m:null, n:null
        };
    }
}