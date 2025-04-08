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
    a: Int;
    b: Bool;
}

contract DeepNestTest {
    data: Deep;

    init() {
        self.data = Deep{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        a: 123,
                        b: false
                    }
                }
            }
        };
    }
}