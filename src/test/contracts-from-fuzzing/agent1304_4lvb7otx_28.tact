struct Inner { x: Int?; }
struct Outer { inner: Inner?; }

contract OptOptField {
  data: Outer?;

  init() {
    self.data = null;
  }
}