struct DeepOptional {
    level1: Int?;
    level2: Bool?;
    level3: String?;
}

struct WrapOptional {
    opt: DeepOptional?;
}

contract MultiOptionals {
    nestedOpt: WrapOptional;

    init() {
        self.nestedOpt = WrapOptional{
            opt: null
        };
    }
}