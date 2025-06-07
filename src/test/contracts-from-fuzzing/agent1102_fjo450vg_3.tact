struct DeepNested {
    level3: Int;
}

struct NestedLevel2 {
    level2: DeepNested;
}

struct NestedLevel1 {
    level1: NestedLevel2;
}

contract ContractDeepNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            level1: NestedLevel2{
                level2: DeepNested{
                    level3: 99
                }
            }
        };
    }
}
