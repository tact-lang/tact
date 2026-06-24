// deeply nested with top struct optional
struct Innermost {
  foo: Int;
  bar: Bool;
}

struct Middle {
  inner: Innermost;
}

struct Top {
  mid: Middle;
}

contract TopLevelOpt {
  t: Top? = null;
  init() {}
}