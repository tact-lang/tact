struct NestedOptional {
  x: Int?;
  y: Int?;
}

struct Wrap {
  inner: NestedOptional?;
}

contract TestContract {
  state: Wrap;

  init() {
    self.state = Wrap{ inner: null };
  }
}