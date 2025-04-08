struct Level3 {
    z: Int = 3;
    o: Int? = null;
}

struct Level2 {
    inner3: Level3 = Level3{};
    y: Int = 2;
}

struct Level1 {
    inner2: Level2 = Level2{};
    x: Int = 1;
}

contract TestDeepNested {
    nested: Level1 = Level1{};
}