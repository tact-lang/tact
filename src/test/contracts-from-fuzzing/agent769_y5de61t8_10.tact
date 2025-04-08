struct NestedStr {
  inner: Int;
}

struct MidStr {
  middle: NestedStr;
}

struct OuterStr {
  outer: MidStr;
}

contract AccessChain {
  data: OuterStr;

  init() {
    self.data = OuterStr{
      outer: MidStr{
        middle: NestedStr{
          inner: 77
        }
      }
    };
  }
}