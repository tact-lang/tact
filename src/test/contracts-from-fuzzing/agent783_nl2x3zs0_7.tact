struct Level3 {
  value: Int?;
}

struct Level2 {
  deeper: Level3?;
}

struct Level1 {
  deeper: Level2?;
}

contract RecursiveLikeOptionals {
  top: Level1?;

  init() {
    self.top = Level1{
      deeper: Level2{
        deeper: Level3{value: null}
      }
    };
  }
}