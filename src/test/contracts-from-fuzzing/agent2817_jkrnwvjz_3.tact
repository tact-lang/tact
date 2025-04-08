struct NestedOptional {
  name: String?;
  number: Int?;
}

struct Wrapper {
  nested: NestedOptional;
}

contract Test {
  state: Wrapper;

  init() {
    self.state = Wrapper{ nested: NestedOptional{ name: null, number: null } };
  }
}
