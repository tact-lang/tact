struct Level3 {
    b: Int;
}

struct Level2 {
    a: Level3;
}

struct Level1 {
    v: Level2;
}

contract MultiLevel {
    root: Level1;

    init() {
      self.root = Level1{
        v: Level2{
          a: Level3{b: 123}
        }
      };
    }
}
