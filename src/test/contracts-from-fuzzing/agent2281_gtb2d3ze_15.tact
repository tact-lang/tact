struct NestedOptDefault {
  x: Int? = null;
}

struct Level2 {
  n: NestedOptDefault;
  s: String? = null;
}

contract DeepDefaults {
  val: Level2;

  init() {
    self.val = Level2{ n: NestedOptDefault{}, s: null };
  }
}