struct Inner {
  y: Int? = null;
}

struct Outer {
  inner: Inner? = null;
}

contract OptionalChain {
  field: Outer? = null;

  init() {}
}
