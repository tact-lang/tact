struct NestedOnceMore {
  foo: String;
  bar: Inner;
}

struct Inner {
  baz: String;
  qux: DeepInner;
}

struct DeepInner {
  val: Int;
  text: String;
}

contract TestNestedOnceMore {
  d: NestedOnceMore;

  init() {
    self.d = NestedOnceMore{
      foo: "abc",
      bar: Inner{
        baz: "def",
        qux: DeepInner{ val: 5, text:"ghi"}
      }
    };
  }
}
