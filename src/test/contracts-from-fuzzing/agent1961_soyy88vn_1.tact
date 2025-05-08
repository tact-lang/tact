struct DeepOptional {
    opt1: Int?; 
    opt2: Bool?;
    opt3: String?;
    nested: NestedOpt?;
}

struct NestedOpt {
    inner1: Int?;
    inner2: Bool?;
}

contract TestOptional {
    s: DeepOptional;
    init() {
        self.s = DeepOptional{
            opt1: null,
            opt2: true,
            opt3: "abc",
            nested: NestedOpt{
                inner1: 1,
                inner2: false
            }
        };
    }
}