struct Level4 {
    f1: Int;
}

struct Level3 {
    s: Level4;
}

struct Level2 {
    s: Level3;
}

struct Level1 {
    s: Level2;
}

contract FourNest {
    data: Level1;

    init() {
        self.data = Level1{
            s: Level2{
                s: Level3{
                    s: Level4{
                        f1: 123
                    }
                }
            }
        };
    }
}