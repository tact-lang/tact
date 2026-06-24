struct OptPrims {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: String?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    opts: OptPrims;

    init() {
        self.opts = OptPrims{a:null,b:null,c:null,d:null,e:null,f:null};
    }
}