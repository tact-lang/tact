struct Level3 {
    val: Int = 7;
}

struct Level2 {
    l3: Level3?; // optional Level3
}

struct Level1 {
    l2: Level2;
}

contract DeepOptionals {
    state: Level1 = Level1{ l2: Level2{ l3: null } };
}