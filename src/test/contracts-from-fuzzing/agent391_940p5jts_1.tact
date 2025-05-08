struct DeepNest {
    nested1: NestedOptional;
    nested2: NestedOptional;
}

struct NestedOptional {
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            nested1: NestedOptional{ optInt: 1, optBool: false },
            nested2: NestedOptional{ optInt: null, optBool: true },
        };
    }
}