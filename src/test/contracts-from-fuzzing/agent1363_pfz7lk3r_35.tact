struct DeeplyNested {
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
    lvl6: Int;
}

contract DeepNestTest {
    n: DeeplyNested;

    init() {
        self.n = DeeplyNested{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        lvl4: Level4{
                            lvl5: Level5{
                                lvl6: 999,
                            }
                        }
                    }
                }
            }
        };
    }
}