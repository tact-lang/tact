struct InnerLevel1 {
  a: Int;
}

struct InnerLevel2 {
  x: InnerLevel1;
}

contract NestedOptWrap {
  d: InnerLevel2?;

  init() {
    self.d = null;
  }
}