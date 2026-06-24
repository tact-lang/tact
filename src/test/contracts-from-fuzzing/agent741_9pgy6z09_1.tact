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
    val1: Int;
    optVal: Int?;
}

contract TestNested {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        val1: 42,
                        optVal: null
                    }
                }
            }
        };
    }
}