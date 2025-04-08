struct ManyOptionalNesting {
    l1: Int?;
    l2: Int?;
    l3: Int?;
    l4: Int?;
}

struct WrapOpt {
    optStruct: ManyOptionalNesting?;
}

contract DeepOptional {
    container: WrapOpt;
    init() {
        self.container = WrapOpt{optStruct: null};
    }
}