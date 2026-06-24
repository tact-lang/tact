struct NestedLevel3 {
    val3: Int?;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
}

contract DeepNestedStruct {
    nested1: NestedLevel1;
    init() {
        self.nested1 = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{
                    val3: null
                }
            }
        };
    }
}