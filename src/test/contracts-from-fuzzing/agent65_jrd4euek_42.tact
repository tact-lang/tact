struct Nested1 {
  val: Int;
}

struct Nested2 {
  inner: Nested1?;
}

contract OptionalInner {
  n: Nested2;
  init() {
    self.n = Nested2{
      inner: null
    };
  }
}