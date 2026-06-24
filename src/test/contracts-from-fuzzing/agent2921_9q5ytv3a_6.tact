struct NestedLevel3 {
    a: Int;
}

struct NestedLevel2 {
    level3: NestedLevel3;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

contract DeepNest {
    nest: NestedLevel1;
    
    init() {
        self.nest = NestedLevel1{
            level2: NestedLevel2{
                level3: NestedLevel3{
                    a: 99
                }
            }
        };
    }
}