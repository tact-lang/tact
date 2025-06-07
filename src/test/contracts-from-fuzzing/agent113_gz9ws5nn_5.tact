struct InnerMost {
  val: Int;
}

struct Middle {
  inner: InnerMost;
}

struct Outer {
  middle: Middle;
}

contract DeepNestedFields {
  field: Outer;

  init() {
    self.field = Outer{
      middle: Middle{
        inner: InnerMost{
          val: 1234
        }
      }
    };
  }
}