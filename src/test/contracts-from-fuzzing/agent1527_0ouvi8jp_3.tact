struct DeepNestedMore {
    level2: DeepNested;
    anotherInt: Int;
}

struct DeepNested {
    inner: NestedOptional;
}

struct NestedOptional {
    value: Int?;
}

contract TestContract {
    data: DeepNestedMore;
    init() {
        self.data = DeepNestedMore{
            level2: DeepNested{
                inner: NestedOptional{ value: null }
            },
            anotherInt: 42
        };
    }
}
