struct Level3 { z: Int; }
struct Level2 { y: Level3; }
struct Level1 { x: Level2; }

contract DeepChain {
    val: Level1 = Level1{ x: Level2{ y: Level3{ z: 0 } } };
}