struct LevelThree {
    someInt: Int?;
    someStr: String?;
}

struct LevelTwo {
    lvl3: LevelThree?;
    flag2: Bool?;
}

struct LevelOne {
    lvl2: LevelTwo?;
    flag1: Bool?;
}

contract ComplexOptionals {
    nested: LevelOne = LevelOne{
        lvl2: null,
        flag1: null,
    };

    receive() {}
}