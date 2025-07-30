struct DeeplyOptional {
    level1: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    level2: Int?;
    inner2: InnerOpt2?;
}

struct InnerOpt2 {
    level3: Int?;
}

contract OptionalDepth {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            level1: 1,
            inner: InnerOpt{
                level2: 2,
                inner2: InnerOpt2{
                    level3: 3
                }
            }
        };
    }
}