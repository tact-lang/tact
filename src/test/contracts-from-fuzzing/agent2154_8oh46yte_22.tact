struct PrimOpt {
    n: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: Slice?;
    str: String?;
}

contract OptionalPrims {
    p: PrimOpt;

    init() {
        self.p = PrimOpt{n:null,b:null,a:null,c:null,s:null,str:null};
    }
}