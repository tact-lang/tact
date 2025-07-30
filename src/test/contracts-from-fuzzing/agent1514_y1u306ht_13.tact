struct DeepNestedOptional {
    n1: Int?;
    n2: Bool?;
}

struct MiddleOptional {
    deep: DeepNestedOptional?;
}

struct Top {
    middle: MiddleOptional?;
}

contract Test {
    data: Top = Top{middle: null};
    init() {
        self.data = Top{
            middle: MiddleOptional{
                deep: DeepNestedOptional{n1: 1, n2: false}
            }
        };
    }
}