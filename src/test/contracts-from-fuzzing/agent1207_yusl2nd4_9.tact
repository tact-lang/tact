struct DeepOptional {
    nested: Int?;
}

struct MiddleOptional {
    level: DeepOptional?;
}

contract OptionalDeepChain {
    chain: MiddleOptional;

    init() {
        self.chain = MiddleOptional{
            level: null
        };
    }
}