struct Level3 {
  val: Int?;
}

struct Level2 {
  inner: Level3?;
}

struct Level1 {
  deep: Level2?;
}

contract OptionalDeepFields {
  field: Level1;

  init() {
    self.field = Level1{ deep: Level2{ inner: Level3{ val: 123 } } };
  }
}