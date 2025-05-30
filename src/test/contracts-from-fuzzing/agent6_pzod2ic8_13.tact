struct SOptional {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

struct SContainer {
    s1: SOptional;
    s2: SOptional;
}

contract MultipleOptionalContainers {
    data: SContainer;
    init() {
        self.data = SContainer{
            s1: SOptional{
                intOpt: null,
                boolOpt: true,
                strOpt: null,
            },
            s2: SOptional{
                intOpt: 42,
                boolOpt: null,
                strOpt: "str",
            }
        };
    }
}