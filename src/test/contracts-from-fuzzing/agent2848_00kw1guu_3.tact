struct DeepNested {
    level2: InnerStruct;
}

struct InnerStruct {
    level1: Int;
}

contract DeepNestedField {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{ level2: InnerStruct{ level1: 1 } };
    }
}