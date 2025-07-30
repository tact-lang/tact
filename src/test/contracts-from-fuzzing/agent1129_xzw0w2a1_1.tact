struct NestedLevel3 {
    a: Int;
}

struct NestedLevel2 {
    l3: NestedLevel3;
}

struct NestedLevel1 {
    l2: NestedLevel2;
}

contract DeepNestedContract {
    nested: NestedLevel1;
    
    init() {
        self.nested = NestedLevel1{
            l2: NestedLevel2{
                l3: NestedLevel3{
                    a: 42
                }
            }
        };
    }
}