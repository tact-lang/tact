struct NullableDeep {
  level1: Level1?;
}

struct Level1 {
  level2: Level2?;
}

struct Level2 {
  val: Int?;
}

contract TestNullableDeep {
  data: NullableDeep;

  init() {
    self.data = NullableDeep{ level1: null };
  }
}