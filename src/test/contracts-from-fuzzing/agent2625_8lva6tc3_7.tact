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
    flag: Bool;
    opt_str: String?;
    num: Int;
}

contract DeepHierarchy {
    root: Level1;

    init() {
        self.root = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    lvl4: Level4{
                        flag: true,
                        opt_str: null,
                        num: 777
                    }
                }
            }
        };
    }
}
