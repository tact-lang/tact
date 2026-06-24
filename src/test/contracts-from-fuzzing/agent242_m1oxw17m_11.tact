struct BigNested {
 a: Level1;
}

struct Level1 {
 b: Level2;
 count: Int;
}

struct Level2 {
 c: Level3;
 s: String;
}

struct Level3 {
 d: Level4;
 b: Bool;
}

struct Level4 {
 x: Int;
 y: Bool;
 z: String?;
}

contract ChainTest {
  data: BigNested;

  init() {
    self.data = BigNested{
      a: Level1{
        b: Level2{
          c: Level3{
            d: Level4{
              x: 1,
              y: true,
              z: null,
            },
            b: false,
          },
          s: "s",
        },
        count: 4,
      },
    };
  }
}