struct MixOpt {
    a: Int?;
    b: Bool?;
}

contract OptMixStruct {
    m: MixOpt;
    init() {
        self.m = MixOpt{a:null,b:true};
    }
}