contract DeepChain {
    lvl1: Level1;

    init() {
        self.lvl1 = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    lvl4: Level4{
                        lvl5: Level5{
                            lvl6: Level6{
                                value: 123
                            }
                        }
                    }
                }
            }
        };
    }
}

struct Level1 { lvl2: Level2; }
struct Level2 { lvl3: Level3; }
struct Level3 { lvl4: Level4; }
struct Level4 { lvl5: Level5; }
struct Level5 { lvl6: Level6; }
struct Level6 { value: Int; }
