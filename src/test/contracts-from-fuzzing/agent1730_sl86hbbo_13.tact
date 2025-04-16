struct Inner {
  x: Int;
}

struct Outer {
  wrapped: Inner?;
}

contract OuterOptionalTest {
  item: Outer;

  init() {
    self.item = Outer{
      wrapped: null
    };
  }
}