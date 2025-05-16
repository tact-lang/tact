// deeply nested persist fields
struct Level3 {
    flag: Bool;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepPersistent {
    big: Level1;

    init() {
        self.big = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    flag: true
                }
            }
        };
    }
}