struct Level3 { z: Int; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract Test {
    data: Level1 = Level1{ l2: Level2{ l3: Level3{ z: 0 } } };
}