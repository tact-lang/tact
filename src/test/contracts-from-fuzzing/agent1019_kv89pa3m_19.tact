struct NestedD {
  inner: Int? = null;
}

struct OuterD {
  x: Int = 5;
  y: NestedD = NestedD{};
}

contract DefaultsInNest {
  state: OuterD;

  init() {
    self.state = OuterD{};
  }
}
