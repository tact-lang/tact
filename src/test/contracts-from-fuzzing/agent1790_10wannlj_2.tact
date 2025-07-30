struct Level3 {
    d: Int = 4;
}

struct Level2 {
    c: Level3 = Level3{};
}

struct Level1 {
    b: Level2 = Level2{};
}

contract Test {
    deep: Level1 = Level1{};
    init() {}
}
