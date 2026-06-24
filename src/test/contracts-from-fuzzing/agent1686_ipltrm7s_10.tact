struct Level3 {
  x: Int;
  y: Int;
}

struct Level2 {
  child: Level3;
  b: Bool;
}

struct Level1 {
  child: Level2;
  txt: String;
}

contract NestedMixed {
  data: Level1;

  init() {
    self.data = Level1{
      child: Level2{
        child: Level3{x: 1, y: 2},
        b: false
      },
      txt: "hi"
    };
  }
}