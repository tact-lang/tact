struct Inner {
  foo: Int;
  bar: Bool;
  baz: String;
}

struct Outer {
  a: Int;
  b: Bool;
  inner: Inner;
}

contract NestedFields {
  data: Outer;

  init() {
    self.data = Outer{
      a: 10,
      b: true,
      inner: Inner{
        foo: 1,
        bar: false,
        baz: "hello"
      }
    };
  }
}