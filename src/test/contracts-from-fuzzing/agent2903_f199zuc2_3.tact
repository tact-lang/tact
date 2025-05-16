struct Level3 {
  a: Int;
}

struct Level2 {
  inner: Level3;
  b: Bool;
}

struct Level1 {
  nested: Level2;
  x: Int;
}

contract DeepNested {
  state: Level1 = Level1{
    nested: Level2{
      inner: Level3{
        a: 10
      },
      b: true
    },
    x: 5
  };
}