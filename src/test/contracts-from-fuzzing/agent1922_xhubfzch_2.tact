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
    val: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        val: 42
                    }
                }
            }
        };
    }
}