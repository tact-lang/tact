struct InnerMost {
  val: Int?;
}

struct Middle {
  inner: InnerMost;
}

contract NestedNullable {
  m: Middle;

  init() {
    self.m = Middle{
      inner: InnerMost{
        val: null
      }
    };
  }
}
