struct Level1 {
    x: Int;
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

struct Level5 {
    lvl4: Level4;
}

struct Level6 {
    lvl5: Level5;
}

contract VeryDeep {
    val: Level6;

    init() {
        self.val = Level6{
            lvl5: Level5{
                lvl4: Level4{
                    lvl3: Level3{
                        lvl2: Level2{
                            lvl1: Level1{
                                x:99
                            }
                        }
                    }
                }
            }
        };
    }
}