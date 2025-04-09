struct DeeplyNested {
    third: Int;
}

struct MiddleOptional {
    second: DeeplyNested?;
}

struct TopOptional {
    first: MiddleOptional?;
}

contract OptionalNestedChain {
    field: TopOptional;

    init() {
        self.field = TopOptional{
            first: null
        };
    }
}