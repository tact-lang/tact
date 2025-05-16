// optional defaults on nested struct optional
struct SInner {
  val: Int?;
}

contract DNest {
  s: SInner?;

  init() {
    self.s = null;
  }
}
