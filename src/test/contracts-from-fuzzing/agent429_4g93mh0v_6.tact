struct Inner {
  foo: Int;
  bar: Bool?;
}

struct Outer {
  nested: Inner?;
  val: String;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{ foo: 123, bar: null },
      val: "hi"
    };
  }
}