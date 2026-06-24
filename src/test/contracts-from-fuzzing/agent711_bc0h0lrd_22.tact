struct LevelC {
    a: Int;
}

struct LevelB {
    c1: LevelC;
    c2: LevelC;
}

struct LevelA {
    b1: LevelB;
    b2: LevelB;
}

contract DeepTree {
    data: LevelA;

    init() {
        self.data = LevelA{
            b1: LevelB{
                c1: LevelC{a:1},
                c2: LevelC{a:2}
            },
            b2: LevelB{
                c1: LevelC{a:3},
                c2: LevelC{a:4}
            }
        };
    }
}
