struct InnerS {
    f1: Int?;
    f2: Bool;
    f3: String?;
}

struct OuterS {
    inA: InnerS;
    inB: InnerS;
}

contract NestedMix {
    val: OuterS;

    init() {
        self.val = OuterS{ inA: InnerS{ f1:null, f2:true, f3:null }, inB: InnerS{ f1:1, f2:false, f3:"x" } };
    }
}