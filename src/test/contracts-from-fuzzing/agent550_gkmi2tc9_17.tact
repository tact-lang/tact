struct NestedWithDefaults {
  sub: SubDefault;
}

struct SubDefault {
  x: Int = 17;
  y: Bool = false;
}

contract Test {
  val: NestedWithDefaults;
  init() {
    self.val = NestedWithDefaults{ sub: SubDefault{} };
  }
}