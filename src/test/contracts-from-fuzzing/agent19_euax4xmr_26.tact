struct Inner {
  foo: Int? = null;
}

struct Outer {
  bar: Inner? = null;
}

contract Test {
  data: Outer?;
}