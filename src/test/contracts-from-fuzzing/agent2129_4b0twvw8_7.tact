struct DeepOpt {
  x: Int?;
  y: String?;
}

struct Level2 {
  d: DeepOpt;
}

struct Level1 {
  l2: Level2;
}

contract DeepOptContract {
  state: Level1;

  init() {
    self.state = Level1{
      l2: Level2{
        d: DeepOpt{ x: null, y: null }
      }
    };
  }
}