struct Level3 {
  val: Int;
}

struct Level2 {
  inner: Level3;
}

struct Level1 {
  nested: Level2;
}

contract MultiNested {
  deeply: Level1;

  init() {
    self.deeply = Level1{
      nested: Level2{
        inner: Level3{
          val: 99,
        },
      },
    };
  }
}