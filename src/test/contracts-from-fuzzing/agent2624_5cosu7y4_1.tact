struct DeepNested {
    level1: NestedLevel1;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

struct NestedLevel2 {
    level3: NestedLevel3;
}

struct NestedLevel3 {
    number: Int;
}

contract TestDeepNesting {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level1: NestedLevel1{
                level2: NestedLevel2{
                    level3: NestedLevel3{
                        number: 42
                    }
                }
            }
        };
    }
}
