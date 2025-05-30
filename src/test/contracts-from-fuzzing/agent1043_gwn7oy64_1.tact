struct Inner {
  a: Int;
  b: String;
}

struct Outer {
  inner: Inner;
  flag: Bool;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{ a: 5, b: "hello" },
      flag: true
    };
  }
}