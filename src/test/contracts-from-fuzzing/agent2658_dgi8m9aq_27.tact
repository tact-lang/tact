struct Level3 {
    l3: Int;
}

struct Level2 {
    l2: Level3;
}

struct Level1 {
    l1: Level2;
}

contract ThreeDeep {
    d: Level1 = Level1{ l1: Level2{ l2: Level3{ l3: 999 } } };
}