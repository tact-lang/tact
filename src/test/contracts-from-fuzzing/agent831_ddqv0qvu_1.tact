struct NestedInner {
  value: Int;
  flag: Bool;
}

struct NestedOuter {
  inner: NestedInner;
  flag2: Bool;
}

contract TestContract {
  data: NestedOuter;

  init() {
    self.data = NestedOuter{
      inner: NestedInner{value: 5, flag: true},
      flag2: false
    };
  }
}