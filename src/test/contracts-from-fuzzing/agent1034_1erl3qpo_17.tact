struct Level3 {
    val: Bool?;
}

struct Level2 {
    deep: Level3;
}

struct Level1 {
    mid: Level2;
}

contract DeepOptionals {
    chain: Level1 = Level1{ mid: Level2{ deep: Level3{ val: null } } };
}