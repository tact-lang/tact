contract DeepNestedStructTest {
    root: Level1;

    init() {
        self.root = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    value: 42
                }
            }
        };
    }
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    value: Int;
}
