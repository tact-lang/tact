struct Level1 {
    f1: Bool;
    l2: Level2;
}

struct Level2 {
    f2: Int?;
    l3: Level3;
}

struct Level3 {
    f3: Bool?;
    l4: Level4;
}

struct Level4 {
    f4: Int;
}

contract FourLevelsDeep {
    data: Level1;

    init() {
        self.data = Level1{
            f1: true,
            l2: Level2{
                f2: null,
                l3: Level3{
                    f3: false,
                    l4: Level4{
                        f4: 123
                    }
                }
            }
        };
    }
}