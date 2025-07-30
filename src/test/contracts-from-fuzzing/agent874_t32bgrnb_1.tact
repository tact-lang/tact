struct Inner {
  foo: Int;
  bar: Bool;
}

struct Outer {
  nested: Inner;
  val: Int;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{foo: 1, bar: true},
      val: 2
    };
  }
}