struct Level3 {
    val: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract NestedNullDefaults {
    nested: Level1 = Level1{ l2: null };
}