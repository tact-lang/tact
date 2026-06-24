struct DeepInner {
  foo: Int?;
  bar: Bool?;
}

struct Wrapper {
  nested: DeepInner?;
}

contract Test {
  field: Wrapper;

  init() {
    self.field = Wrapper{nested: null};
  }
}