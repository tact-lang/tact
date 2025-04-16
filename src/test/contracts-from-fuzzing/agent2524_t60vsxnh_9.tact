struct Level3 {
    val3: Int = 3;
}

struct Level2 {
    l3: Level3 = Level3{};
}

struct Level1 {
    l2: Level2 = Level2{};
}

contract DeepDefaults {
    l1: Level1 = Level1{};
}