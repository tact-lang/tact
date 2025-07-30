struct DeepNested {
    level3: Level3;
}

struct Level3 {
    level2: Level2;
}

struct Level2 {
    level1: Level1;
}

struct Level1 {
    val: Int;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level3: Level3{
                level2: Level2{
                    level1: Level1{
                        val: 77
                    }
                }
            }
        };
    }
}