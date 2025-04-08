struct DeeplyNestedOptional {
    innermost: Int?;
}

struct MiddleLayer {
    middleOpt: DeeplyNestedOptional?;
}

struct TopLayer {
    topOpt: MiddleLayer?;
}

contract MultiOptional {
    value: TopLayer;

    init() {
        self.value = TopLayer{
            topOpt: null
        };
    }
}