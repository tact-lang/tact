struct DeepNested {
    level1: Int;
    level2: InnerLevel;
}

struct InnerLevel {
    inner: Innermost;
}

struct Innermost {
    value: Int;
}

contract DeepNestedField {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level1: 1,
            level2: InnerLevel{
                inner: Innermost{value: 99}
            }
        };
    }
}
