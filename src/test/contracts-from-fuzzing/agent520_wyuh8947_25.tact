// nested struct with optional nested and some defaults
struct Nested {
  inner1: Int = 2;
  inner2: String? = null;
}

contract OptionalNestedDefault {
  s: Nested? = null;

  init() {
    self.s = null;
  }
}