struct LargeNested {
  a: Int;
  b: LargeNestedInner;
}

struct LargeNestedInner {
  c: Int;
  d: LargeNestedInnerMost;
}

struct LargeNestedInnerMost {
  e: Int;
  f: Int;
}

contract LargeNestedContract {
  data: LargeNested;

  init() {
    self.data = LargeNested{
      a: 1,
      b: LargeNestedInner{
        c: 2,
        d: LargeNestedInnerMost{ e: 3, f: 4 }
      }
    };
  }
}
