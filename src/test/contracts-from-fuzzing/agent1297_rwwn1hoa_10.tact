struct Level3 {
    val: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract DeepNulls {
    root: Level1 = Level1{ l2: null };
    init() {}
}