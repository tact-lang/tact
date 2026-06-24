struct LotsOfOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Cell?;
    j: Slice?;
    k: Builder?;
}

contract TestContract {
    opts: LotsOfOptionals;
    init() {
        self.opts = LotsOfOptionals{
            a:null, b:1, c:null, d:3, e:null,
            f:true, g:null, h:null, i:null, j:null, k:null
        };
    }
}
