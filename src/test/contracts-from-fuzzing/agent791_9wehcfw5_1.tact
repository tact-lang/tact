struct VeryDeep {
  inner: InnerDeep;
}

struct InnerDeep {
  nested: NestedDeep;
}

struct NestedDeep {
  x: Int;
  y: Bool;
}

contract DeepContract {
  val: VeryDeep;

  init() {
    self.val = VeryDeep{ inner: InnerDeep{ nested: NestedDeep{ x: 7, y: true } } };
  }
}