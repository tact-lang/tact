struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract ArrayOptionChain {
    o0: InnerOpt;
    o1: InnerOpt;
    init() {
        self.o0 = InnerOpt{ a:null,b:true };
        self.o1 = InnerOpt{ a:2,b:null };
    }
}