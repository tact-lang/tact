struct Level3 {
  v: Int;
}

struct Level2 {
  l3: Level3;
  s: String;
}

struct Level1 {
  l2: Level2;
  optStr: String?;
}

contract MultiLevel {
  data: Level1;
  init() {
    self.data = Level1{
      l2: Level2{
        l3: Level3{
          v: 99
        },
        s: "deep"
      },
      optStr: null
    };
  }
}