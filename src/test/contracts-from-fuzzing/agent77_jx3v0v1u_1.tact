struct NestedInner {
  niVal: Int;
  niFlag: Bool;
}

struct NestedOuter {
  noInner: NestedInner;
  noOptional: NestedInner?;
}

contract DeepNestTest {
  val: NestedOuter;

  init() {
    self.val = NestedOuter{
      noInner: NestedInner{niVal: 1, niFlag: true},
      noOptional: null
    };
  }
}