struct ManyOpts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract SoManyOpts {
    m: ManyOpts;

    init() {
        self.m = ManyOpts{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}