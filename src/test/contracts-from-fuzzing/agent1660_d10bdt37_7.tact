struct DeeplyOptional {
    innerOpt: Int?;
    strOpt: String?;
    boolOpt: Bool?;
}

struct Container {
    f1: DeeplyOptional;
    f2: DeeplyOptional;
}

contract Test7 {
    data: Container;
    init() {
        self.data = Container {
            f1: DeeplyOptional { innerOpt:null, strOpt:null, boolOpt:true },
            f2: DeeplyOptional { innerOpt:7, strOpt:"hi", boolOpt:null }
        };
    }
}