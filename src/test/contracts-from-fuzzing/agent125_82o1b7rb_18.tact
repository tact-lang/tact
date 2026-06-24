struct MultiLevel {
    a: Int;
    lvl1: Level1;
}

struct Level1 {
    b: Int;
    lvl2: Level2;
}

struct Level2 {
    c: Int;
    lvl3: Level3;
}

struct Level3 {
    d: Int;
}

contract TestContract {
    storage: MultiLevel;
    init() {
        self.storage = MultiLevel{
            a:1,
            lvl1: Level1{
                b:2,
                lvl2: Level2{
                    c:3,
                    lvl3: Level3{ d:4 }
                }
            }
        };
    }
}