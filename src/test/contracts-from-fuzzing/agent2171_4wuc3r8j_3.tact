struct DeepNestLevel3 {
    a: Int;
}

struct DeepNestLevel2 {
    level3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    level2: DeepNestLevel2;
}

contract DeepNestTest {
    root: DeepNestLevel1;
    
    init() {
        self.root = DeepNestLevel1{
            level2: DeepNestLevel2{
                level3: DeepNestLevel3{
                    a: 123
                }
            }
        };
    }
}