struct InnerMost {
  val: Int;
}
struct Middle {
  nested: InnerMost;
}
struct OuterMost {
  nested: Middle;
}

contract OptionalsComplex {
  content: OuterMost?;

  init() {
    self.content = null;
  }
}