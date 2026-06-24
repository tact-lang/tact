// contract field with nested struct containing optional inside optional
struct Inner { val: Int?; }
struct Outer { inner: Inner?; }

contract Test {
  data: Outer;
  init() {
    self.data = Outer{
      inner: null
    };
  }
}