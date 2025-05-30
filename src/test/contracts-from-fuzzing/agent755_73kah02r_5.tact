struct Inner {
  foo: Int;
  bar: Bool;
}

struct Mid {
  i: Int;
  inner: Inner;
}

struct Outer {
  title: String;
  mid: Mid;
}

contract Test5 {
  val: Outer;

  init() {
    self.val = Outer{
      title: "deep",
      mid: Mid{
        i: 7,
        inner: Inner{
          foo: 42,
          bar: true,
        }
      }
    };
  }
}
