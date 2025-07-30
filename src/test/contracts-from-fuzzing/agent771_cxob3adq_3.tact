struct NestedLevel3 {
    value3: Int = 3;
    text3: String = "Level3";
}

struct NestedLevel2 {
    value2: Int = 2;
    level3: NestedLevel3 = NestedLevel3{};
}

struct NestedLevel1 {
    value1: Int = 1;
    level2: NestedLevel2 = NestedLevel2{};
}

contract DeepNestedContract {
    nested: NestedLevel1 = NestedLevel1{};

    init() {
        self.nested = NestedLevel1{
            value1: 11,
            level2: NestedLevel2{
                value2: 22,
                level3: NestedLevel3{
                    value3: 33,
                    text3: "UpdatedLevel3",
                }
            }
        };
    }
}