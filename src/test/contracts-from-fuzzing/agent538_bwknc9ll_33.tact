struct Level1 {
    v: Int;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

contract MultiNest {
    level3: Level3;

    init() {
        self.level3 = Level3{
            l2: Level2{
                l1: Level1{
                    v: 5
                }
            }
        };
    }
}