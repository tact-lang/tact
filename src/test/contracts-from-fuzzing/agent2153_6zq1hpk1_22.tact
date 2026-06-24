struct Level1 {
    i: Int;
    level2: Level2;
}

struct Level2 {
    j: Int;
    level3: Level3;
}

struct Level3 {
    k: Int;
}

contract DeepThree {
    l1: Level1;

    init() {
        self.l1 = Level1{
            i: 1,
            level2: Level2{
                j: 2,
                level3: Level3{ k: 3 }
            }
        };
    }
}
