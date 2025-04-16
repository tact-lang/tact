struct Inner { a: Int; b: Int; }
struct Outer { x: Int; y: Inner; z: Int; }
contract FieldReordering {
  data: Outer;
  init() {
    self.data = Outer{
      x: 1,
      y: Inner{ a: 2, b: 3 },
      z: 4
    };
  }
}
