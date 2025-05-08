struct LargeNest {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
    lvl2b: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    a: Int;
    b: Bool;
}

contract TestContract {
    val: LargeNest;

    init() {
        self.val = LargeNest{
            lvl1: Level1{
                lvl2: Level2{ lvl3: Level3{ a:1, b:true } },
                lvl2b: Level2{ lvl3: Level3{ a:2, b:false } },
            }
        };
    }
}