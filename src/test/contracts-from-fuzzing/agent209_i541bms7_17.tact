// Contract with nested Int serializations across structs
struct NestedInner {
  x: Int as uint32;
}
struct NestedOuter {
  y: NestedInner;
}

contract NestedIntSerialize {
  data: NestedOuter;

  init() {
    self.data = NestedOuter{
      y: NestedInner{
        x: 123456
      }
    };
  }
}