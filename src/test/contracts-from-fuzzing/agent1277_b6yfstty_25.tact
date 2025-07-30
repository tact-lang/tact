struct NestedBoolOptionals {
  flag1: Bool?;
  flag2: Bool?;
}

struct MoreNest {
  nested: NestedBoolOptionals?;
  val: Int;
}

contract TestContract {
  mn: MoreNest;
  init() {
    self.mn = MoreNest{nested: null, val: 777};
  }
}