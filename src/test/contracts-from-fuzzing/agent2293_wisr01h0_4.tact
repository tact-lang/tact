struct Level3 { z: Bool }
struct Level2 { y: Level3 }
struct Level1 { x: Level2 }

contract DeepNest {
  l1: Level1 = Level1{ x: Level2{ y: Level3{ z: false } } };
}