struct Inner {
  foo: Int = 2;
  bar: Bool? = true;
}

struct Outer {
  nested: Inner = Inner{};
  val: Int = 7;
}

contract Test {
  data: Outer?;

  init() {
    self.data = Outer{
      val: 999
    };
  }
}