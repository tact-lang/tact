struct WithString {
  s: String;
}

struct Wrapper {
  w: WithString;
}

contract DoubleNestedString {
  nested: Wrapper;

  init() {
    self.nested = Wrapper{w:WithString{s:"hello"}};
  }
}