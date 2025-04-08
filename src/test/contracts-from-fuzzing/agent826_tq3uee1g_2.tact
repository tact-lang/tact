struct DeepNestLevel3 {
    deepest: Int;
}

struct DeepNestLevel2 {
    nested: DeepNestLevel3;
}

struct DeepNestLevel1 {
    nested: DeepNestLevel2;
}

contract DeepTest {
    root: DeepNestLevel1;

    init() {
        self.root = DeepNestLevel1{
            nested: DeepNestLevel2{
                nested: DeepNestLevel3{
                    deepest: 123
                }
            }
        };
    }
}