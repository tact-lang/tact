struct DeepNested {
    intField: Int;
}

struct MiddleNested {
    deep: DeepNested;
}

contract DeepNestTest {
    nested: MiddleNested;

    init() {
        self.nested = MiddleNested{deep: DeepNested{intField: 7}};
    }
}