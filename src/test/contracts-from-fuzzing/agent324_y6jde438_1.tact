struct DeepNestLevel3 {
    leaf1: Int;
    leaf2: Bool;
    leaf3: String;
}

struct DeepNestLevel2 {
    opt_nested3: DeepNestLevel3?;
    val: Int;
}

struct DeepNestLevel1 {
    nested2: DeepNestLevel2;
}

contract DeepNestedStorage {
    nested: DeepNestLevel1;

    init() {
        self.nested = DeepNestLevel1{
            nested2: DeepNestLevel2{
                opt_nested3: DeepNestLevel3{
                    leaf1: 1,
                    leaf2: true,
                    leaf3: "test",
                },
                val: 100,
            }
        };
    }
}