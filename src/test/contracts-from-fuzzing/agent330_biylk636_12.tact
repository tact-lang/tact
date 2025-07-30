struct Level3 {
  a: Int;
  b: Bool;
}

struct Level2 {
  nested: Level3;
  s: String;
}

struct Level1 {
  nested: Level2;
  slice: Slice;
}

contract DeepNested {
  data: Level1;

  init() {
    self.data = Level1{
      nested: Level2{
        nested: Level3{
          a: 5,
          b: false
        },
        s: "hi"
      },
      slice: emptyCell().asSlice()
    };
  }
}
