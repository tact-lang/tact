struct LevelC {
  x: Int?;
}

struct LevelB {
  y: LevelC;
}

struct LevelA {
  z: LevelB;
}

contract ComplexNestedFields {
  val: LevelA;

  init() {
    self.val = LevelA{
      z: LevelB{
        y: LevelC{
          x: null
        }
      }
    };
  }
}