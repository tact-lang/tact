struct LotsOfOptionals {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: Bool?;
    g: Int?;
    h: String?;
    i: Address?;
    j: Cell?;
}

contract ManyOptionals {
    opt: LotsOfOptionals;

    init() {
        self.opt = LotsOfOptionals{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null
        };
    }
}