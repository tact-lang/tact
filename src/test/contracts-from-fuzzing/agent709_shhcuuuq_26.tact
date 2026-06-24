struct Inner {
  x: Int = 42;
}

struct Outer {
  inn: Inner = Inner{};
}

contract TestContract {
  nested: Outer = Outer{};
}