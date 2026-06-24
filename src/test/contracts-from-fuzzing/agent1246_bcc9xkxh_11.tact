struct DeepOptional {
    x: Int?;
}

struct MiddleOptional {
    deep: DeepOptional?;
}

contract OptionalChain {
    middle: MiddleOptional?;

    init() {
        self.middle = null;
    }
}
