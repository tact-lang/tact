struct NestedOptionalInner {
  field: Int;
}

struct NestedContainer {
  optInner: NestedOptionalInner?;
  flag: Bool;
}

contract NestedOptionalStructField {
  store: NestedContainer;

  init() {
    self.store = NestedContainer{
      optInner: null,
      flag: true
    };
  }
}