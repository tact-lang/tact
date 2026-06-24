struct DeepOpt {
    inner: String?;
    flag: Bool?;
}

struct NestOpt {
    deep1: DeepOpt?;
    deep2: DeepOpt?;
}

contract OptionalLayers {
    nested: NestOpt;
    init() {
        self.nested = NestOpt{
            deep1: DeepOpt{inner:null, flag:null},
            deep2: null
        };
    }
}