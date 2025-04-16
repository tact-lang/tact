struct Level3 {
    z: Int = 3;
}

struct Level2 {
    y: Int = 2;
    l3: Level3 = Level3{ z: 3 };
}

struct Level1 {
    x: Int = 1;
    l2: Level2 = Level2{ y: 2, l3: Level3{ z: 3 } };
}

contract DeepTest {
    l1: Level1 = Level1{ x: 1, l2: Level2{ y: 2, l3: Level3{ z: 3 } } };
    init() {}
}