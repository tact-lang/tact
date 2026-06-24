struct Level3 {
  x: Int;
  y: Bool;
}

struct Level2 {
  nested: Level3;
  tag: String;
}

struct Level1 {
  deeper: Level2;
}

contract TestContract {
  data: Level1;

  init() {
    self.data = Level1{
      deeper: Level2{
        nested: Level3{x:1, y:true},
        tag:"deep"
      }
    };
  }
}