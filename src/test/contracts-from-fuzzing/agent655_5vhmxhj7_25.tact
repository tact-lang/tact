struct BigNesting {
    level1: Int;
    level2: Level2;
}

struct Level2 {
    a: Int;
    level3: Level3;
}

struct Level3 {
    a: Int;
    level4: Level4;
}

struct Level4 {
    a: Int;
    level5: Level5;
}

struct Level5 {
    a: Int;
}

contract DeepNest {
    s: BigNesting;

    init() {
        self.s = BigNesting{
            level1: 1,
            level2: Level2{
                a: 2,
                level3: Level3{
                    a: 3,
                    level4: Level4{
                        a: 4,
                        level5: Level5{ a:5 },
                    }
                }
            }
        };
    }
}
