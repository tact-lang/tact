struct Level3 {
  z: Bool;
}

struct Level2 {
  y: Int?;
  sub3: Level3;
}

struct Level1 {
  x: Int;
  sub2: Level2;
}

contract TestContract {
  complex: Level1;

  init() {
    self.complex = Level1{
      x: 10,
      sub2: Level2{
        y: null,
        sub3: Level3{
          z: false,
        }
      }
    };
  }
}