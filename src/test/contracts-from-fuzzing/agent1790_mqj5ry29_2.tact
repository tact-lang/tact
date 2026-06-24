struct Deep {
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

contract MultiLevel {
    param: Deep;

    init() {
        self.param = Deep{
            level1: Level1{
                level2: Level2{
                    level3: Level3{val: 99}
                }
            }
        };
    }
}
