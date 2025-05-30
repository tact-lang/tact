struct DeepOpt {
    innerDeep: Int?;
    another: Bool;
}

struct MiddleOpt {
    deepOpt: DeepOpt?;
    foo: Int;
}

struct OuterOpt {
    middleOpt: MiddleOpt?;
}

contract OptChain {
    top: OuterOpt = OuterOpt{middleOpt:null};
}