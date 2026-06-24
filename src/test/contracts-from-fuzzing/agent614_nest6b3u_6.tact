struct Level3 {
  inner: String?;
  flag: Bool;
}

struct Level2 {
  l3a: Level3;
  l3b: Level3;
}

struct Level1 {
  l2a: Level2;
  l2b: Level2;
}

contract TestContract {
  state: Level1;

  init() {
    self.state = Level1{
      l2a: Level2{
        l3a: Level3{
          inner: null,
          flag: true
        },
        l3b: Level3{
          inner: "hi",
          flag: false
        }
      },
      l2b: Level2{
        l3a: Level3{
          inner: "world",
          flag: true
        },
        l3b: Level3{
          inner: null,
          flag: false
        }
      }
    };
  }
}