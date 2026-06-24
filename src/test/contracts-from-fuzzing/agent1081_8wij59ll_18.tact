struct Level1 { v: Int; }
struct Level2 { lvl1: Level1; }
struct Level3 { lvl2: Level2; }
struct Level4 { lvl3: Level3; }
struct Level5 { lvl4: Level4; }
struct Level6 { lvl5: Level5; }
struct Level7 { lvl6: Level6; }
struct Level8 { lvl7: Level7; }

contract EightDeep {
    val: Level8;

    init() {
        self.val = Level8{ lvl7: Level7{
            lvl6: Level6{
                lvl5: Level5{
                    lvl4: Level4{
                        lvl3: Level3{
                            lvl2: Level2{
                                lvl1: Level1{v:123}
                            }
                        }
                    }
                }
            }
        }};
    }
}