struct Level2 {
  deep: String?;
}

struct Level1 {
  inner: Level2?;
}

contract OptionNestContract {
  data: Level1?;

  init() {
    self.data = Level1{
      inner: Level2{
        deep: "maybe"
      }
    };
  }
}