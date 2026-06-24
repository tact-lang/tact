struct L3 { val: Int?; }
struct L2 { inner: L3?; }
struct L1 { inner: L2?; }

contract OptDeepNull {
  root: L1?;

  init() {
    self.root = null;
  }
}