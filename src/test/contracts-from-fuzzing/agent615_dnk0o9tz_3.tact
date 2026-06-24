struct NestedOptionalStruct {
  a: Int;
  b: OptionalInner?;
}

struct OptionalInner {
  x: Int;
  y: Bool;
}

contract TestContract {
  s: NestedOptionalStruct;

  init() {
    self.s = NestedOptionalStruct{
      a: 1,
      b: OptionalInner{
        x: 2,
        y: true
      }
    };
  }
}