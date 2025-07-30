struct Deep {
    level1: Int;
    level2: Level2;
}

struct Level2 {
    level3: Int;
    level4: Level4;
}

struct Level4 {
    level5: Int;
}

contract C {
    f: Deep;

    init() {
        self.f = Deep{
            level1:1,
            level2: Level2{
                level3:2,
                level4: Level4{
                    level5:3
                }
            }
        };
    }
}