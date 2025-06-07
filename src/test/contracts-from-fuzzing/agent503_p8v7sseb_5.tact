struct Level2 {
  a: Int?;
  b: Bool?;
}

struct Level1 {
  inner: Level2;
  c: String = "hello";
}

contract DeepDefaults {
  info: Level1;

  init() {
    self.info = Level1{
      inner: Level2{ a: 55, b: null }
    };
  }
}
