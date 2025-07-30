struct DeepNestLevel3 {
    x: String?;
    y: Bool;
}

struct DeepNestLevel2 {
    level3: DeepNestLevel3;
    n: Int = 0;
}

struct DeepNestLevel1 {
    level2: DeepNestLevel2;
}

contract Test {
    data: DeepNestLevel1 = DeepNestLevel1{
        level2: DeepNestLevel2{
            level3: DeepNestLevel3{x: null, y: false},
            n: 0,
        }
    };

    init() {
        self.data = DeepNestLevel1{
            level2: DeepNestLevel2{
                level3: DeepNestLevel3{x: "hello", y: true},
                n: 123,
            }
        };
    }
}