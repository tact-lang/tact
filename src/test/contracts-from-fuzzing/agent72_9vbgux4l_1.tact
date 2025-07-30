struct NestedInner {
  x: Int;
  y: Int?;
}

struct NestedOuter {
  point: NestedInner;
  label: String;
}

contract DeepNestedTest {
  data: NestedOuter;

  init() {
    self.data = NestedOuter{
      point: NestedInner{
        x: 42,
        y: null,
      },
      label: "test"
    };
  }
}