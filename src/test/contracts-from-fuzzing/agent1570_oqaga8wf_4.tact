struct DeepNested {
    level1: Int;
    level2: NestedLevel2;
}

struct NestedLevel2 {
    sub: NestedLevel3;
}

struct NestedLevel3 {
    flag: Bool;
    num: Int;
}

contract DeepNestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            level1: 1,
            level2: NestedLevel2{
                sub: NestedLevel3{
                    flag: true,
                    num: 42
                }
            }
        };
    }
}