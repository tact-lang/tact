struct Level3 { z: Bool }
struct Level2 { y: Level3 }
struct Level1 { x: Level2 }

contract Test {
  deep: Level1 = Level1{
    x: Level2{
      y: Level3{ z: false }
    }
  };
  receive() {}
}