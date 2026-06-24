struct MixOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionWrap {
    m1: MixOpt;
    m2: MixOpt;

    init() {
        self.m1 = MixOpt{a:null,b:null,c:null};
        self.m2 = MixOpt{a:null,b:null,c:null};
    }
}