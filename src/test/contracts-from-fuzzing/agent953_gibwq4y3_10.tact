struct Level3 {
    z: Int = 3;
}

struct Level2 {
    inner: Level3 = Level3{};
}

struct Level1 {
    inner: Level2 = Level2{};
}

contract Test {
    nested: Level1 = Level1{};
}