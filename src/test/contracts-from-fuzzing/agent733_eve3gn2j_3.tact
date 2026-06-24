struct Inner {
  a: Int = 5;
  b: Bool = false;
}

struct Outer {
  inner: Inner = Inner{};
  flag: Bool = true;
}

contract TestContract {
  data: Outer = Outer{};
  init() {}
}