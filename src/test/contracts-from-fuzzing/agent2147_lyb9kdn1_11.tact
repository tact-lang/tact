struct Level3 {
    a: Int = 3;
    b: Bool?;
}

struct Level2 {
    l3: Level3?;
    c: String?;
}

struct Level1 {
    l2: Level2?;
    d: Int?;
}

contract DeepNestDefault {
    root: Level1 = Level1{};
}