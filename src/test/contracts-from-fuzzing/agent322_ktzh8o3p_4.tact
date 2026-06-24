struct Level3 {
    val: String?;
}

struct Level2 {
    l3: Level3;
    count: Int?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract DeepNest {
    state: Level1 = Level1{
        l2: Level2{ l3: Level3{ val: null }, count: null },
        flag: false
    };
}