struct NestedLevel3 {
    value: Int;
}

struct NestedLevel2 {
    level3: NestedLevel3;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

contract DeepContract {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            level2: NestedLevel2{
                level3: NestedLevel3{
                    value: 123
                }
            }
        };
    }
}