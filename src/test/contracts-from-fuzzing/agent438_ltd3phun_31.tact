// Contract with defaulted nested struct fields
struct Inner {
  value: Int = 99;
}

struct Outer {
  inner: Inner = Inner{};
}

contract TestContract {
  nested: Outer = Outer{};
  init() {}
}