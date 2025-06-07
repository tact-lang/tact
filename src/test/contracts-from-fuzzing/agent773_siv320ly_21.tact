struct DeepOptional {
    next: OptionalMid?;
}

struct OptionalMid {
    finalVal: Bool;
}

contract OptionInChain {
    chain: DeepOptional;

    init() {
        self.chain = DeepOptional{
            next: OptionalMid{
                finalVal: false,
            },
        };
    }
}