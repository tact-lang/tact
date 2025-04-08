struct DeepInner {
  a: Int;
}

struct MidInner {
  b: DeepInner;
}

struct Outer {
  c: MidInner;
}

contract DeepTest {
  field: Outer;
  init() {
    self.field = Outer{c: MidInner{b: DeepInner{a: 123}}};
  }
}