struct Level4 {
    flag: Bool?;
}

struct Level3 {
    lvl4: Level4;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract Test {
    st: Level1;

    init() {
        self.st = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    lvl4: Level4{ flag: null }
                }
            }
        };
    }
}