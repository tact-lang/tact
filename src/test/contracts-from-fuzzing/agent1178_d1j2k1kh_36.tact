// nested struct mixing primitives and optionals
struct Sub {
  a: Int;
  b: String?;
  c: Bool;
}

struct Main {
  s: Sub?;
  d: Int;
}

contract Test {
  data: Main;
  init() {
    self.data = Main{
      s: null,
      d: 42
    };
  }
}