struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  foo: Int;
  bar: Inner;
  baz: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
      self.data = Outer{
        foo: 5,
        bar: Inner{
          a: 1,
          b: true
        },
        baz: false
      };
    }
}