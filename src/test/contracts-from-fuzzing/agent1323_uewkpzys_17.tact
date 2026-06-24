struct WithVariousOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Builder?;
    g: Slice?;
}

contract OptStructsMix {
    s: WithVariousOptionals;

    init() {
        self.s = WithVariousOptionals{
            a:null, b:true, c:null, d:null, e:null, f:null, g:null
        };
    }
}
