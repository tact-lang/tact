struct Level1 {
  next: Level2;
}

struct Level2 {
  val: Int;
  flag: Bool;
}

contract PartialNested {
  top: Level1;

  init() {
    // initialize only Level1 but not nested Level2
    self.top = Level1 {
      next: Level2 {
        val: 0,
        flag: false
      }
    };
  }
}