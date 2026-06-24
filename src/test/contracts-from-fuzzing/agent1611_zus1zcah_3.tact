struct DeeplyNested {
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
    flag: Bool?;
}

contract DeepNestTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        val: 42,
                        flag: null
                    }
                }
            }
        };
    }
}