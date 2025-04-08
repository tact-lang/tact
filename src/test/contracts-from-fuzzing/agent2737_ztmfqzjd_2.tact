contract DeepNestedTest {
    level1: Level1;

    init() {
        self.level1 = Level1{
            level2: Level2{
                level3: Level3{
                    val: 100
                }
            }
        };
    }
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