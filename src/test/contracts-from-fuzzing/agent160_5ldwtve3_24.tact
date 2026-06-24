struct BoolNest {
    flag: Bool;
    optFlag: Bool?;
    deep: InnerBool;
}

struct InnerBool {
    subFlag: Bool;
    subOpt: Bool?;
}

contract TestBoolNesting {
    data: BoolNest;
    init() {
        self.data = BoolNest{
            flag:true,
            optFlag:null,
            deep: InnerBool{
                subFlag:false,
                subOpt:null
            }
        };
    }
}