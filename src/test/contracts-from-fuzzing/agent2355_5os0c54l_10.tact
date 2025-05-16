struct ManyNestedLevels {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    lvl4: Level4;
}

struct Level4 {
    lvl5: Level5;
}

struct Level5 {
    f: Int;
}

contract DeepTree {
    root: ManyNestedLevels;

    init() {
        self.root = ManyNestedLevels{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        lvl4: Level4{
                            lvl5: Level5{
                                f: 12345
                            }
                        }
                    }
                }
            }
        };
    }
}