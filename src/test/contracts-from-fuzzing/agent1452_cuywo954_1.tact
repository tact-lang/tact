struct DeepNestLevel3 {
    value: Int?;
}

struct DeepNestLevel2 {
    nested3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    nested2: DeepNestLevel2;
}

contract DeepNestedStorage {
    root: DeepNestLevel1;

    init() {
        self.root = DeepNestLevel1{
            nested2: DeepNestLevel2{
                nested3: DeepNestLevel3{
                    value: null
                }
            }
        };
    }
}
