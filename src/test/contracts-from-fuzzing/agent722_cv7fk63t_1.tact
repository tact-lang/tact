struct NestedInner {
  a: Int;
  b: Bool?;
  c: String;
}

struct NestedOuter {
  x: Int;
  y: NestedInner;
  z: Int?;
}

contract DeepNestedTest {
  s: NestedOuter;
  init() {
    self.s = NestedOuter{
      x: 1,
      y: NestedInner{a:2, b:true, c:"hi"},
      z: null
    };
  }
}