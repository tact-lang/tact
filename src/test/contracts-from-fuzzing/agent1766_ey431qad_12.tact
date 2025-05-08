struct InnerOptional {
    value: Int?;
}

struct MiddleOptional {
    innerOpt: InnerOptional?;
}

struct OuterOptional {
    middleOpt: MiddleOptional?;
}

contract DeepNullable {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            middleOpt: null
        };
    }
}
