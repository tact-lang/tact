struct DefaultOptNested {
  opt1: Level1?;
}

struct Level1 {
  opt2: Level2?;
}

struct Level2 {
  val: Int = 42;
}

contract Test {
  d: DefaultOptNested;
  init() {
    self.d = DefaultOptNested{ opt1:null };
  }
}