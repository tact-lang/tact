struct DeepNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    a: Int;
    b: String?;
}

contract TestContract {
    nested: DeepNested;
    
    init() {
        self.nested = DeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        a: 42,
                        b: "hello"
                    }
                }
            }
        };
    }
}
