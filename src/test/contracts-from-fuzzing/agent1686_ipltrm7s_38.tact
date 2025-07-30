struct NesterDefault {
  foo: Int = 5;
}

struct NesterOuter {
  nest: NesterDefault;
}

contract DefNestedStructs {
  val: NesterOuter;

  init() {
    self.val = NesterOuter{ nest: NesterDefault{} };
  }
}