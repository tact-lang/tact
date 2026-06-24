struct Level0 {
    f0: Int;
    lvl1: Level1;
}

struct Level1 {
    f1: Int;
    lvl2: Level2;
}

struct Level2 {
    f2: Int;
    lvl3: Level3;
}

struct Level3 {
    f3: Int;
    lvl4: Level4;
}

struct Level4 {
    f4: Int;
}

contract TestContract {
    deep: Level0;

    init() {
        self.deep = Level0{
            f0: 0,
            lvl1: Level1{
                f1:1,
                lvl2: Level2{
                    f2:2,
                    lvl3: Level3{
                        f3:3,
                        lvl4: Level4{ f4:4 }
                    }
                }
            }
        };
    }
}