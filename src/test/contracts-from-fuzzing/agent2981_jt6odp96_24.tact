struct Level3 {
  a: Int;
}

struct Level2 {
  b: Level3;
}

struct Level1 {
  c: Level2;
}

contract NestTest {
  data: Level1;

  init() {
    self.data = Level1{
      c: Level2{
        b: Level3{
          a: 999,
        },
      },
    };
  }
}