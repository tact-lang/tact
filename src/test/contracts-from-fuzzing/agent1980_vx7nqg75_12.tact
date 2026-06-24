struct DeepOpt {
    x: Int?;
    y: Bool?;
}

struct SuperDeep {
    v1: DeepOpt?;
    v2: DeepOpt?;
}

contract MultiOpt {
    data: SuperDeep;

    init() {
        self.data = SuperDeep{
            v1: null,
            v2: null
        };
    }
}