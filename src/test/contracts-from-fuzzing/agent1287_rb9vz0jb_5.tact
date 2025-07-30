struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Builder?;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract TestContract {
    bigOpt: LargeOptional;

    init() {
        self.bigOpt = LargeOptional{
            a:null, b:true, c:null, d:null, e:null, f:null,
            g:null, h:null, i:false, j:"hello",
        };
    }
}