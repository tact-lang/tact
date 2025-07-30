struct Wrapper {
  payload: Wrapped;
}

struct Wrapped {
  s: String;
}

contract InnerString {
  x: Wrapper;
  init() {
    self.x = Wrapper{payload: Wrapped{s:"x"}};
  }
}