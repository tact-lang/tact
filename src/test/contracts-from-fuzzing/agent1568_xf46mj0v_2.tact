struct Level3 {
  i3: Int;
  b3: Bool;
}

struct Level2 {
  l3: Level3;
  s2: String;
}

struct Level1 {
  l2: Level2;
  flag1: Bool;
  txt1: String;
}

contract DeepNestContract {
  storage: Level1;

  init() {
    self.storage = Level1{
      l2: Level2{
        l3: Level3{
          i3: 5,
          b3: true,
        },
        s2: "s2text",
      },
      flag1: false,
      txt1: "txt1text",
    };
  }
}