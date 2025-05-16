// deeply nested optional inside optional inside optional
struct Level1 {
  val: Int;
}

struct Level2 {
  l1: Level1?;
}

contract TooDeepOpt {
  payload: Level2?;

  init() {
    self.payload = Level2{ l1: null };
  }
}
