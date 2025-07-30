struct LevelC {
    v: Int?;
    s: String?;
}

struct LevelB {
    sub: LevelC;
    flag: Bool?;
}

struct LevelA {
    nested: LevelB;
    rootVal: Int;
}

contract OptDeep {
    x: LevelA;

    init() {
        self.x = LevelA{
            rootVal: 5,
            nested: LevelB{
                flag: null,
                sub: LevelC{ v: null, s: null },
            }
        };
    }
}
