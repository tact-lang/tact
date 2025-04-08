struct DeepOption {
    inner: Int?;
}

struct MidLevel {
    deep1: DeepOption;
    deep2: DeepOption;
}

contract MultipleNestedOptional {
    nested: MidLevel;

    init() {
        self.nested = MidLevel{
            deep1: DeepOption{ inner: null },
            deep2: DeepOption{ inner: 123 }
        };
    }
}