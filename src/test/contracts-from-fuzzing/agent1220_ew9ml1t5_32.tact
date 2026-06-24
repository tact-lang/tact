struct BigNested {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    val: Int;
}

contract MultiDeep {
    dat: BigNested;

    init() {
        self.dat = BigNested{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        val: 1
                    }
                }
            }
        };
    }
}