struct Level3 {
  done: Bool;
}

struct Level2 {
  inner: Level3;
  flag: Bool;
}

struct Level1 {
  inner: Level2;
  count: Int;
}

contract DeepNested {
  nested: Level1;

  init() {
    self.nested = Level1{
      inner: Level2{
        inner: Level3{
          done: false
        },
        flag: true
      },
      count: 42
    };
  }
}
