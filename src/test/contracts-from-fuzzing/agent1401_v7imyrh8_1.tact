struct NestedNested {
  val: Int;
}

struct Nested {
  val: Int;
  nn: NestedNested;
}

contract DeepStructTest {
  s: Nested;

  init() {
    self.s = Nested{
      val: 1,
      nn: NestedNested{val: 2},
    };
  }
}