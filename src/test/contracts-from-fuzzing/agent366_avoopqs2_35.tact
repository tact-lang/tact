struct SimpleNested {
  nested: NestedInner?;
}

struct NestedInner {
  x: Int;
  y: Int;
}

contract NullableInnerTest {
  val: SimpleNested;
  init() {
    self.val = SimpleNested{
      nested: null
    };
  }
}