struct NestedOpt {
    v1: Int?;
    s1: String?;
}

struct OuterOpt {
    innerOpt1: NestedOpt?;
    innerOpt2: NestedOpt?;
    flag: Bool;
}

contract DeepOptionals {
    data: OuterOpt;
    
    init() {
        self.data = OuterOpt{
            innerOpt1: null,
            innerOpt2: NestedOpt{ v1: 2, s1: "hi" },
            flag: false
        };
    }
}