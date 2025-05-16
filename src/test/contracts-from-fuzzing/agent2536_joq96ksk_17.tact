// test init with nested optional structs with defaults
struct SInner {
  a: Int? = null;
}

struct SOuter {
  inner: SInner? = null;
}

contract DefaultsNestedOptionals {
  data: SOuter;

  init() {
    self.data = SOuter{};
  }
}