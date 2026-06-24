struct DeepNested {
    level1: Int;
    level2: NestedStruct;
}

struct NestedStruct {
    flag: Bool;
    value: Int?;
}

contract ComplexNestedStorage {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level1: 5,
            level2: NestedStruct{
                flag: true,
                value: null
            }
        };
    }
}