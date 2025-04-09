struct NestedInner {
  b1: Bool;
  s1: String;
}

struct NestedOuter {
  in1: Int;
  inner: NestedInner;
  in2: Int;
}

contract DeepNestedTest {
  field: NestedOuter;
  
  init() {
    self.field = NestedOuter{
      in1: 1,
      inner: NestedInner{ b1: true, s1: "abc" },
      in2: 2,
    };
  }
}