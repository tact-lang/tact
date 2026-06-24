struct Level3 {
    x: Int;
    flag: Bool;
}

struct Level2 {
    l3_1: Level3;
    l3_2: Level3;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract WideNested {
    data: Level1 = Level1 {
        l2: Level2{
            l3_1: Level3{ x: 1, flag: true },
            l3_2: Level3{ x: 2, flag: false },
        },
        flag: true,
    };

    init() {}
}