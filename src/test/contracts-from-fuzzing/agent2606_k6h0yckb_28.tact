struct Outer {
  inner: Inner;
}

struct Inner {
  s: String;
  flag: Bool;
}

contract TestOrder {
  store: Outer;
  num: Int = 5;

  init() {
    self.store = Outer{ inner: Inner{ s: "abc", flag: true } };
  }
}