struct Level3 {
  x: Int;
  y: Bool;
}

struct Level2 {
  nested3: Level3;
  z: String;
}

struct Level1 {
  nested2: Level2;
  a: Int;
}

contract NestedStructs {
  top: Level1;

  init() {
    self.top = Level1{
      nested2: Level2{
        nested3: Level3{ x: 5, y: false },
        z: "deep"
      },
      a: 42
    };
  }
}
