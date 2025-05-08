struct Level1 {
    val: Int;
}

struct Level2 {
    lvl1: Level1;
}

struct Level3 {
    lvl2: Level2;
}

struct Level4 {
    lvl3: Level3;
}

contract ChainedNested {
    root: Level4;

    init() {
        self.root = Level4{
            lvl3: Level3{
                lvl2: Level2{
                    lvl1: Level1{ val: 100 }
                }
            }
        };
    }
}