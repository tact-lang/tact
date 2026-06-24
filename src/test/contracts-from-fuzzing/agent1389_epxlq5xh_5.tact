struct DeepOptional {
    nestedOpt: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract OptChain {
    chain: DeepOptional;

    init() {
        self.chain = DeepOptional{
            nestedOpt: InnerOpt{ value: null },
        };
    }
}