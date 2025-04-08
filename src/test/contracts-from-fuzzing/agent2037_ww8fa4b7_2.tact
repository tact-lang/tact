struct DeepNestedLevel3 {
    a: Int;
}

struct DeepNestedLevel2 {
    l3: DeepNestedLevel3;
}

struct DeepNestedLevel1 {
    l2: DeepNestedLevel2;
}

contract DeepNestedContract {
    nested: DeepNestedLevel1;

    init() {
        self.nested = DeepNestedLevel1{
            l2: DeepNestedLevel2{
                l3: DeepNestedLevel3{
                    a: 777
                }
            }
        };
    }
}
