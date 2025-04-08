struct DeepLevel3 {
    l3field: String;
}

struct DeepLevel2 {
    l2field: DeepLevel3;
}

struct DeepLevel1 {
    l1field: DeepLevel2;
}

contract DeepNestedStructs {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{
            l1field: DeepLevel2{
                l2field: DeepLevel3{
                    l3field: "deep"
                }
            }
        };
    }
}
