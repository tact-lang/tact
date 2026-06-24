struct DeeplyOptional {
    opt1: Int?;
    nested: InnerOpt;
}

struct InnerOpt {
    o2: Int?;
    o3: Int?;
}

contract OptionalDeepNest {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            opt1: null,
            nested: InnerOpt{
                o2:null,
                o3:null
            }
        };
    }
}