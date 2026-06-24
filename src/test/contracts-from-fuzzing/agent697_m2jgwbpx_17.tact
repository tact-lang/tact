struct ChildA {
  foo: Int?;
  bar: Bool;
}

struct ChildB {
  baz: String;
  qux: Bool?;
}

contract Test {
  a: ChildA? = null;
  b: ChildB? = null;

  init() {
    self.a = ChildA{ foo:10, bar:true };
    self.b = ChildB{ baz:"ok", qux:false };
  }

  receive() {}
}