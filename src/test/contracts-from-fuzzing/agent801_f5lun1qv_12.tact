struct LevelC {
    c1: Int?;
    c2: Bool?;
}

struct LevelB {
    b1: Int;
    b2: LevelC;
}

struct LevelA {
    a1: Bool;
    a2: LevelB;
}

contract MultiLevelOptionals {
    root: LevelA;

    init() {
        self.root = LevelA{
            a1: true,
            a2: LevelB{
                b1: 123,
                b2: LevelC{
                    c1: null,
                    c2: false
                }
            }
        };
    }
}