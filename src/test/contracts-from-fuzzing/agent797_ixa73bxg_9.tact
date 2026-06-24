struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract TestDeepOptNested {
    storage: Level1 = Level1 { nested: null };

    init() {}
}