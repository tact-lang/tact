struct DeepOptional {
    level: Int;
}

struct MiddleOptional {
    nested: DeepOptional?;
}

contract NestedOptionalContract {
    holder: MiddleOptional;

    init() {
        self.holder = MiddleOptional{
            nested: null
        };
    }
}