struct Inner {
  foo: Int? = 1;
}

struct Outer {
  bar: Inner? = Inner{};
}

contract Test {
  data: Outer?;

  init() {
    self.data = Outer{
      bar: Inner{
        foo: null
      }
    };
  }
}