// test optional nested inside struct optional
struct Inner { x: Int; }
struct Wrapper { inner: Inner?; }
contract Test {
  data: Wrapper?;
  init() {
    self.data = null;
  }
}