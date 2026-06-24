struct Level3 {
    innerOpt: Bool? = null;
}

struct Level2 {
    level3: Level3 = Level3{};
}

struct Level1 {
    x: Level2 = Level2{};
}

contract DeepOptNulls {
    nested: Level1 = Level1{};
}