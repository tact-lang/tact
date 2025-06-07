struct Inner {
  foo: Int;
}

struct Outer {
  bar: Inner? = null;
}

contract TestContract {
  nested: Outer = Outer{};
}