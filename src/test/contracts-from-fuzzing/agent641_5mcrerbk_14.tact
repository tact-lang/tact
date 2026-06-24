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
    val: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        lvl4: Level4{
                            lvl5: Level5{ val: 2024 }
                        }
                    }
                }
            }
        };
    }
}