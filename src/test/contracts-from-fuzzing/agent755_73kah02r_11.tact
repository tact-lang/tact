struct Level3 {
  foo: Int?;
  bar: Bool?;
}

struct Level2 {
  val: Int;
  nested3: Level3?;
}

struct Level1 {
  title: String;
  nested2: Level2?;
}

contract Test9 {
  nested1: Level1?;

  init() {
    self.nested1 = null;
  }
}
