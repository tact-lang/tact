struct DeepOptStruct {
    n1: Int?;
    n2: Bool?;
    n3: Int?;
    n4: Bool?;
}

struct WrapDeep {
    d1: DeepOptStruct;
    d2: DeepOptStruct;
}

contract MultiDeepOpts {
    w: WrapDeep;
    init() {
        self.w = WrapDeep{
            d1: DeepOptStruct{ n1:null, n2:true, n3:3, n4:null },
            d2: DeepOptStruct{ n1:1, n2:null, n3:null, n4:false }
        };
    }
}