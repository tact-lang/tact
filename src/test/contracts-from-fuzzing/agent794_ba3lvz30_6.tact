struct Level3 {
  a: Int;
  b: Bool;
}

struct Level2 {
  x: Int;
  y: Level3;
}

struct Level1 {
  foo: Bool;
  bar: Level2;
}

contract DeeplyNested {
  data: Level1;

  init() {
    self.data = Level1{
      foo: true,
      bar: Level2{
        x: 5,
        y: Level3{
          a: 99,
          b: false
        }
      }
    };
  }
}
