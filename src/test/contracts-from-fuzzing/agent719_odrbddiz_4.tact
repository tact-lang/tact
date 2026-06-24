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
    level4: Level4;
}

struct Level4 {
    val: Int;
}

contract DeepNestTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        level4: Level4{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}