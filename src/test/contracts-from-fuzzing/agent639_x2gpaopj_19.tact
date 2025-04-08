struct InnerOptStruct {
    maybe: Bool?;
}

struct MiddleOpt {
    innerOpt: InnerOptStruct?;
}

struct OuterOpt {
    middleOpt: MiddleOpt?;
}

contract MultiOptLayers {
    deep: OuterOpt;
    init() {
        self.deep = OuterOpt{
            middleOpt: MiddleOpt{
                innerOpt: InnerOptStruct{ maybe:true }
            }
        };
    }
}