struct Inner {
  foo: Int = 10;
}

struct Outer {
  bar: Inner = Inner{};
}

contract TestContract {
  nested: Outer = Outer{};
}