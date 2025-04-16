struct OptionalNestedSub {
  val: Int;
}

struct OptionalNested {
  sn: OptionalNestedSub?;
  num: Int;
}

contract OptionalNestedContract {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{sn: null, num: 7};
  }
}